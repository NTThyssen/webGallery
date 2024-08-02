package repository

import (
	 blobrepository "justjoew/backend/src/blob_repository"
	"log"

	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

var db *gorm.DB

func InitDb() {

	blobrepository.InitClient();
	db, err := gorm.Open(sqlite.Open("/app/data/data.db"), &gorm.Config{})
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

/*func CreateAsset (domainAsset asset.Asset) (Asset, error){

	res, err := blobrepository.uploadAsset(domainAsset.BlobPath)
		return Asset{}, err

	asset := Asset{
		SectionName: domainAsset.SectionName,
		OrderIndex: domainAsset.OrderIndex,
		SectionId: domainAsset.SectionId,
		BlobPath: ,

	}

	db.Create(asset)

} */
