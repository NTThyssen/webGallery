package blobrepository

import (
	"bytes"
	"context"
	"net/url"
	"time"

	"log"
	"os"

	"github.com/google/uuid"
	"github.com/minio/minio-go/v7"
	"github.com/minio/minio-go/v7/pkg/credentials"
)

var minioClient *minio.Client

func InitClient() {

	accessKey, err := os.ReadFile("/run/secrets/access_key")
	if err != nil {
		panic(err)
	}

	secretKey, err := os.ReadFile("/run/secrets/secret_key")
	if err != nil {
		panic(err)
	}

	minioClient, err = minio.New("minio.justjoew.com", &minio.Options{
		Creds:  credentials.NewStaticV4(string(accessKey), string(secretKey), ""),
		Secure: true,
	})

	if err != nil {
		log.Fatalln(err)
	}

	log.Printf("is online: %v ",  minioClient.IsOnline())
}

func UploadAsset(assetBytes []byte) string {

	objectUuid := uuid.NewString()
	reader := bytes.NewReader(assetBytes)
	_, err := minioClient.PutObject(context.Background(), "assets", objectUuid, reader, reader.Size(), minio.PutObjectOptions{ContentType: "image/png"})

	if err != nil {
		log.Panicln(err)
		return objectUuid
	}
	return objectUuid
}

func CreatePreSignedUrls(objectKey string) string {
	res, err := generatePresignedURL(minioClient, "assets", objectKey, time.Minute*10)
	if err != nil {
		log.Panicf("failed to fetch object %s", objectKey )
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
