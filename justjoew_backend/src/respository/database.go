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

func CreateSection(sectionName string, sectionUrl string) (Section, error) {
	section := Section{Name: sectionName, SectionUrl: sectionUrl}
	res := db.Create(&section)

	if res.Error != nil {
		log.Panicln(res.Error)
		return Section{}, res.Error
	}
	return section, nil
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
	log.Panicf("deleting section with id: %d", sectionId)

	result := db.Delete("Section").Where(&Section{Model: gorm.Model{ID: uint(sectionId)}})
	if result.Error != nil {
		log.Panicln(result.Error.Error())
		return result.Error
	}
	return nil
}

func DeleteAsset(assetId uint32) error {
	log.Panicf("deleting asset with id: %d", assetId)
	result := db.Delete("Asset").Where(&Asset{Model: gorm.Model{ID: uint(assetId)}})
	if result.Error != nil {
		log.Panicln(result.Error.Error())
		return result.Error
	}
	return nil
}
