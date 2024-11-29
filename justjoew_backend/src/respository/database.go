package repository

import (
	"fmt"
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
	res := db.Create(section)

	if res.Error != nil {
		log.Panicln(res.Error)
		return Section{}, res.Error
	}
	return section, nil
}


func UpdateAssetOrder(sectionId uint32, newOrderIndex uint32) (uint32, error) {

	res := db.Updates(&Asset{OrderIndex: newOrderIndex} ).Where("section_id = ?", sectionId);

	if res.Error != nil {
		log.Panicln(res.Error)
		return 0, res.Error
	}
	return newOrderIndex, nil
}

func UpdateSectionOrder(sectionId uint32, newOrderIndex uint32) (uint32, error) {

	res := db.Updates(&Section{OrderIndex: newOrderIndex} ).Where("id = ?", sectionId);

	if res.Error != nil {
		log.Panicln(res.Error)
		return 0, res.Error
	}
	return newOrderIndex, nil
}

func UpdateSectionInfo(sectionId uint32, sectioName string, sectionUrl string) (Section, error) {
	
	section := Section{}
	if sectioName != "" {
        section.Name = sectioName
    }
    if sectionUrl !=  "" {
        section.SectionUrl = sectionUrl
    }

	res := db.Updates(&section).Where("id = ?", sectionId);

	if res.Error != nil {
		log.Panicln(res.Error)
		return Section{}, res.Error
	}
	return section, nil
}

func CreateAsset(domainAsset *pb.CreateAssetRequest) (Asset, error) {
	var dbSection Section
	var assetInSectionCount int64

	res, format,  err := blobrepository.ResizeImageAndUpload(domainAsset.Blob, domainAsset.Filename)

	if err != nil {
		fmt.Printf("error in creating asset: %s", err.Error())
		return Asset{}, err
	}
	dbSection.ID = uint(domainAsset.SectionId)
	db.Where("section_id = ?", dbSection.ID).Count(&assetInSectionCount)

	asset := Asset{
		OrderIndex: uint32(assetInSectionCount),
		SectionID:  domainAsset.SectionId,
		BlobPath:   res[0],
		Format: format,
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
	log.Printf("deleting section with id: %d", sectionId)

	result := db.Where("id = ?", sectionId).Delete(&Section{})
	if result.Error != nil {
		log.Panicln(result.Error.Error())
		return result.Error
	}
	return nil
}

func DeleteAsset(assetId uint32) error {
	log.Printf("deleting asset with id: %d", assetId)
	result := db.Where("id = ?", assetId).Delete(&Asset{})
	if result.Error != nil {
		log.Panicln(result.Error.Error())
		return result.Error
	}
	return nil
}
