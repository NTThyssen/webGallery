package blobrepository

import (
	"bytes"
	"context"
	"fmt"
	"image"
	"image/gif"
	"image/png"

	"log"
	"net/url"

	"os"
	"time"

	"github.com/google/uuid"
	"github.com/minio/minio-go/v7"
	"github.com/minio/minio-go/v7/pkg/credentials"
	"github.com/nfnt/resize"
)

var minioClient *minio.Client

func InitClient() {

	// Access minio bucket
	username := os.Getenv("MINIO_USER")
	password := os.Getenv("MINIO_PASS")

	minioClient, err := minio.New("minio.justjoew.com", &minio.Options{
		Creds:  credentials.NewStaticV4(string(username), string(password), ""),
		Secure: true,
	})

	if err != nil {
		log.Fatalln(err)
	}
	if minioClient == nil {
		log.Fatalln("minio client is nil")
	}
	log.Printf("is online: %v ", minioClient.IsOnline())
}

func ResizeGif(gifData []byte, width, height uint) ([]byte, error) {
	// Create a bytes.Reader to read the GIF data from memory
	reader := bytes.NewReader(gifData)

	// Decode the GIF
	g, err := gif.DecodeAll(reader)
	if err != nil {
		return nil, err
	}

	// Set the global dimensions to the target width and height
	g.Config.Width = int(width)
	g.Config.Height = int(height)

	// Resize each frame and maintain transparency
	for i, originalFrame := range g.Image {
		// Get the original transparent color index
		transparentIndex := g.BackgroundIndex

		// Resize the frame
		resizedFrame := resize.Resize(width, height, originalFrame, resize.Lanczos3)

		// Create a new paletted image for the resized frame with the same palette as the original
		palettedFrame := image.NewPaletted(resizedFrame.Bounds(), originalFrame.Palette)

		// Apply the resized frame onto the paletted frame, setting the transparent pixels
		for y := 0; y < palettedFrame.Bounds().Dy(); y++ {
			for x := 0; x < palettedFrame.Bounds().Dx(); x++ {
				originalColor := resizedFrame.At(x, y)
				if originalFrame.Palette[transparentIndex] == originalColor {
					// Set the transparent color
					palettedFrame.SetColorIndex(x, y, uint8(transparentIndex))
				} else {
					// Set the actual color
					palettedFrame.Set(x, y, originalColor)
				}
			}
		}

		// Replace the frame with the paletted version
		g.Image[i] = palettedFrame
		g.Delay[i] = g.Delay[i] // Keep original delay for each frame
	}

	// Encode the resized GIF to a new byte buffer
	var outputBuffer bytes.Buffer
	err = gif.EncodeAll(&outputBuffer, g)
	if err != nil {
		return nil, err
	}

	// Return the resized GIF as a byte array
	return outputBuffer.Bytes(), nil
}

func ResizeImageAndUpload(byteArray []byte, filename string) ([]string, string, error) {
	sizesList := []uint{512, 384, 256, 196, 128, 112, 56, 28}
	pathList := []string{}
	objectUuid := uuid.NewString()

	img, format, err := image.Decode(bytes.NewReader(byteArray))
	if err != nil {
		fmt.Printf("failed to decode image: %v", err)
		return nil, format, fmt.Errorf("failed to decode image: %v", err)
	}

	if format == "gif" {
		// Handle animated GIFs using ResizeGif function
		for _, size := range sizesList {
			resizedGif, err := ResizeGif(byteArray, size, size)
			if err != nil {
				fmt.Printf("failed to resize GIF: %v", err)
				return nil, format, fmt.Errorf("failed to resize GIF: %v", err)
			}
			path, err := uploadAsset(resizedGif, filename, size, objectUuid, format)
			if err != nil {
				fmt.Printf("failed to upload GIF: %v", err)
				return nil, format, err
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
				return nil, format, err
			}
			path, err := uploadAsset(buf.Bytes(), filename, v, objectUuid, format)
			if err != nil {
				return nil, format, err
			}
			pathList = append(pathList, path)
		}
	}

	return pathList, format, nil

}

func uploadAsset(assetBytes []byte, filename string, ratio uint, objectUuid string, format string) (string, error) {

	reader := bytes.NewReader(assetBytes)

	metadata := map[string]string{
		"X-Amz-Meta-X-Meta-Filename": filename,
	}
	username := os.Getenv("MINIO_USER")
	password := os.Getenv("MINIO_PASS")
	if minioClient == nil {
		client, _ = minio.New("minio.justjoew.com", &minio.Options{
		Creds:  credentials.NewStaticV4(string(username), string(password), ""),
		Secure: true,
	})
	}
	_, err := client.PutObject(context.Background(),
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

func CreatePreSignedUrls(objectKey string, aspectRation uint32, format string) string {
	res, err := generatePresignedURL("assets", fmt.Sprintf("%s/%d.%s", objectKey, aspectRation, format), time.Minute*10)
	if err != nil {
		log.Panicf("failed to fetch object %s/%d", objectKey, aspectRation)
	}
	return res
}
var client *minio.Client
func generatePresignedURL(bucketName, objectName string, expiry time.Duration) (string, error) {
	reqParams := make(url.Values)
username := os.Getenv("MINIO_USER")
	password := os.Getenv("MINIO_PASS")
	// Generate pre-signed GET URL
	
	if minioClient == nil {
		client, _ = minio.New("minio.justjoew.com", &minio.Options{
		Creds:  credentials.NewStaticV4(string(username), string(password), ""),
		Secure: true,
	})
	}
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
