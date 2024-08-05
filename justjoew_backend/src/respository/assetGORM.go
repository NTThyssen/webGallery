package repository

import "gorm.io/gorm"

type Asset struct {
	gorm.Model 
	SectionName string
	BlobPath    string
	OrderIndex  int32
	SectionID   uint // Note the change to uint, which is common for IDs
	Section     Section `gorm:"foreignKey:SectionID"` 
}