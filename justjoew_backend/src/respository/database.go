package repository

import (
	pb "justjoew/backend/protos"
	blobrepository "justjoew/backend/src/blob_repository"
	"log"

	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

var db *gorm.DB

func InitDb() {

	var err error
	blobrepository.InitClient()
	db, err = gorm.Open(sqlite.Open("/app/data/data.db"), &gorm.Config{})
	if err != nil {
		log.Fatal(err)
	}

	db.AutoMigrate(&Section{}, &Asset{})
}

func CreateSection(sectionName string) (string, error) {
	section := Section{Name: sectionName}
	res := db.Create(&section)

	if res.Error != nil {
		log.Panicln(res.Error)
		return "", res.Error
	}
	return sectionName, nil
}

func CreateAsset(domainAsset *pb.CreateAssetRequest) Asset {
	var dbSection Section
	var assetInSectionCount int64
	res := blobrepository.UploadAsset(domainAsset.Blob)
	dbSection.ID = uint(domainAsset.SectionId)
	db.Where(dbSection).Count(&assetInSectionCount)

	asset := Asset{
		OrderIndex: uint32(assetInSectionCount),
		SectionID:  domainAsset.SectionId,
		BlobPath:   res,
	}

	dbRes := db.Create(&asset)

	if dbRes.Error != nil {
		log.Panicln(dbRes.Error)
		return Asset{}
	}

	return asset

}

func GetAllSections() ([]Section, error) {

	var sections []Section
	result := db.Preload("Assets").Find(&sections)

	return sections, result.Error
}
