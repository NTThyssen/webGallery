package repository

import (
	blobrepository "justjoew/backend/src/blob_repository"
	"log"

	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

var db *gorm.DB


func InitDb(){

	blobrepository.InitClient();
  	db, err := gorm.Open(sqlite.Open("test.db"), &gorm.Config{})
	if err != nil {
		log.Fatal(err)
	}

  	db.AutoMigrate(&Section{}, &Asset{})
}
  

func CreateSection(sectionName string) (string, error) {
	res := db.Create(Section{
		Name: sectionName,
	})

	if res.Error != nil{
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