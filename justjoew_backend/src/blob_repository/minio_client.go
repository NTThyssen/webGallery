package blobrepository

import (
	"bytes"
	"context"
	"fmt"
	"image"
	"image/gif"
	"image/png"
	"strings"

	//image "image/png" // to support PNG decoding
	"log"
	"net/url"
	"os"
	"time"

	vault "github.com/hashicorp/vault/api"

	"github.com/google/uuid"
	"github.com/minio/minio-go/v7"
	"github.com/minio/minio-go/v7/pkg/credentials"
	"github.com/nfnt/resize"
)

var minioClient *minio.Client

func InitClient() {

	config := vault.DefaultConfig()
	config.Address = os.Getenv("VAULT_ADDR") // Vault address

	client, err := vault.NewClient(config)
	if err != nil {
		log.Fatal(err)
	}

	// Set the Vault token (use root-token or an app-specific token)
	client.SetToken(os.Getenv("VAULT_TOKEN"))

	// Retrieve the secret from Vault
	secret, err := client.KVv2("kv").Get(context.Background(), "justjoew_backend/config")
	if err != nil {
		log.Fatal(err)
	}

	// Access secret data
	username := secret.Data["username"].(string)
	password := secret.Data["password"].(string)

	minioClient, err = minio.New("minio.justjoew.com", &minio.Options{
		Creds:  credentials.NewStaticV4(string(username), string(password), ""),
		Secure: true,
	})

	if err != nil {
		log.Fatalln(err)
	}

	log.Printf("is online: %v ", minioClient.IsOnline())
}

func ResizeGif(byteArray []byte, sizesList []uint) ([]byte, error) {
	// Decode GIF and get all frames
	gifImg, err := gif.DecodeAll(bytes.NewReader(byteArray))
	if err != nil {
		return nil, fmt.Errorf("failed to decode GIF: %v", err)
	}
	var buf bytes.Buffer
	// Resize each frame and convert it to Paletted
	for _, size := range sizesList {
		resizedGif := &gif.GIF{
			Delay:    gifImg.Delay,
			LoopCount: gifImg.LoopCount,
		}
		for _, frame := range gifImg.Image {
			// Resize the frame
			resizedFrame := resize.Resize(size, size, frame, resize.Lanczos3)

			// Create a new paletted image with the same bounds and palette as the original GIF
			palettedFrame := image.NewPaletted(resizedFrame.Bounds(), frame.Palette)

			// Draw the resized frame onto the new paletted image
			for y := 0; y < resizedFrame.Bounds().Dy(); y++ {
				for x := 0; x < resizedFrame.Bounds().Dx(); x++ {
					palettedFrame.Set(x, y, resizedFrame.At(x, y))
				}
			}

			// Update the bounds of the frame to match the resized GIF canvas
			palettedFrame.Rect = resizedFrame.Bounds()

			// Append resized frame to the new GIF structure
			resizedGif.Image = append(resizedGif.Image, palettedFrame)
		}

		// Encode the resized frames back into an animated GIF
		var buflocal bytes.Buffer
		if err := gif.EncodeAll(&buflocal, resizedGif); err != nil {
			return nil, fmt.Errorf("failed to encode resized GIF: %v", err)
		}
		buf = buflocal;
	}

	return buf.Bytes(), nil
}

func ResizeImageAndUpload(byteArray []byte, filename string) ([]string, error) {
	sizesList := []uint{512, 384, 256, 196, 128, 112, 56, 28}
	pathList := []string{}
	objectUuid := uuid.NewString()

	img, format, err := image.Decode(bytes.NewReader(byteArray))
	if err != nil {
		fmt.Printf("failed to decode image: %v", err)
		return nil, fmt.Errorf("failed to decode image: %v", err)
	}

	if format == "gif" {
		// Handle animated GIFs using ResizeGif function
		for _, size := range sizesList {
			resizedGif, err := ResizeGif(byteArray, []uint{size})
			if err != nil {
				fmt.Printf("failed to resize GIF: %v", err)
				return nil, fmt.Errorf("failed to resize GIF: %v", err)
			}
			path, err := uploadAsset(resizedGif, filename, size, objectUuid, format)
			if err != nil {
				fmt.Printf("failed to upload GIF: %v", err)
				return nil, err
			}
			pathList = append(pathList, path)
		}
	} else {
		// Handle static images (e.g., PNG)
		for _, v := range sizesList {
			imageResize := resize.Resize(v, v, img, resize.Lanczos3)
			var buf bytes.Buffer
			err := png.Encode(&buf, imageResize)
			if err != nil {
				return nil, err
			}
			path, err := uploadAsset(buf.Bytes(), filename, v, objectUuid, format)
			if err != nil {
				return nil, err
			}
			pathList = append(pathList, path)
		}
	}

	return pathList, nil

}

func uploadAsset(assetBytes []byte, filename string, ratio uint, objectUuid string, format string) (string, error) {

	reader := bytes.NewReader(assetBytes)

	metadata := map[string]string{
		"X-Amz-Meta-X-Meta-Filename": filename,
	}
	_, err := minioClient.PutObject(context.Background(),
		"assets",
		fmt.Sprintf("%s/%d.%s",
			objectUuid, ratio, format),
		reader,
		reader.Size(),
		minio.PutObjectOptions{ContentType: fmt.Sprintf("image/%s", format), UserMetadata: metadata})

	if err != nil {
		log.Panicln(err)
		return objectUuid, err
	}
	return objectUuid, nil
}

func CreatePreSignedUrls(objectKey string, aspectRation uint32) string {
	var format = ""
	if strings.Contains(objectKey, "png") {
		format = "png"
	} else {
		format = "gif"
	}
	res, err := generatePresignedURL(minioClient, "assets", fmt.Sprintf("%s/%d.%s", objectKey, aspectRation, format), time.Minute*10)
	if err != nil {
		log.Panicf("failed to fetch object %s/%d", objectKey, aspectRation)
	}
	return res
}

func generatePresignedURL(client *minio.Client, bucketName, objectName string, expiry time.Duration) (string, error) {
	reqParams := make(url.Values)

	// Generate pre-signed GET URL
	preSignedURL, err := client.PresignedGetObject(context.Background(), bucketName, objectName, expiry, reqParams)

	if err != nil {
		return "", err
	}

	return preSignedURL.String(), nil
}

func DeleteAsset(bucketName, objectName string) error {

	// Generate pre-signed GET URL
	err := minioClient.RemoveObject(context.Background(), bucketName, objectName, minio.RemoveObjectOptions{})

	if err != nil {
		return err
	}

	return err
}
