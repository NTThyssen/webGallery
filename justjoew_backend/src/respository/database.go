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

func CreateAsset(domainAsset *pb.CreateAssetRequest) (Asset, error) {
	var dbSection Section
	var assetInSectionCount int64

	res, err := blobrepository.ResizeImageAndUpload(domainAsset.Blob, domainAsset.Filename)

	if err != nil {
		return Asset{}, err
	}
	dbSection.ID = uint(domainAsset.SectionId)
	db.Where(dbSection).Count(&assetInSectionCount)

	asset := Asset{
		OrderIndex: uint32(assetInSectionCount),
		SectionID:  domainAsset.SectionId,
		BlobPath:   res[0],
	}

	dbRes := db.Create(&asset)

	if dbRes.Error != nil {
		log.Panicln(dbRes.Error)
		return Asset{}, db.Error
	}
	
	return asset, nil
}

func GetAllSections() ([]Section, error) {

	var sections []Section
	result := db.Preload("AssetList").Find(&sections)

	return sections, result.Error
}

func DeleteSection(sectionId uint32) error {

	result := db.Delete("Section").Where(sectionId)
	if result.Error != nil {
		return result.Error
	}
	return nil
}
