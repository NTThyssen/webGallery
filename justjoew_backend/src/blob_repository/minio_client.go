package blobrepository

import (
	"bytes"
	"context"
	"fmt"
	image "image/png" // to support PNG decoding
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
    config.Address = "http://0.0.0.0:8200" // Vault address

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

func ResizeImageAndUpload(byteArray []byte, filename string) ([]string, error) {
	sizesList := []uint{512, 384, 256, 196, 128, 112, 56, 28}
	pathList := []string{}
	img, err := image.Decode(bytes.NewReader(byteArray))
	if err != nil {
		return nil, fmt.Errorf("failed to decode image: %v", err)
	}
	objectUuid := uuid.NewString()
	for _, v := range sizesList {
		imageResize := resize.Resize(v, v, img, resize.Lanczos3)
		var buf bytes.Buffer
		err := image.Encode(&buf, imageResize)
		if err != nil {
			return nil, err
		}
		path, err := uploadAsset(buf.Bytes(), filename, v, objectUuid)
		pathList = append(pathList, path)
		if err != nil {
			return nil, err
		}
	}

	return pathList, nil

}

func uploadAsset(assetBytes []byte, filename string, ratio uint, objectUuid string) (string, error) {

	reader := bytes.NewReader(assetBytes)

	metadata := map[string]string{
		"X-Amz-Meta-X-Meta-Filename": filename,
	}
	_, err := minioClient.PutObject(context.Background(),
		"assets",
		fmt.Sprintf("%s/%d.png",
			objectUuid, ratio),
		reader,
		reader.Size(),
		minio.PutObjectOptions{ContentType: "image/png", UserMetadata: metadata})

	if err != nil {
		log.Panicln(err)
		return objectUuid, err
	}
	return objectUuid, nil
}

func CreatePreSignedUrls(objectKey string, aspectRation uint32) string {

	res, err := generatePresignedURL(minioClient, "assets", fmt.Sprintf("%s/%d.png", objectKey, aspectRation), time.Minute*10)
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
