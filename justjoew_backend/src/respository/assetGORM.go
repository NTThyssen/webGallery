package repository

import "gorm.io/gorm"

type Asset struct {
	gorm.Model 
	BlobPath    string
	OrderIndex  uint32
	SectionID   uint32 // Note the change to uint, which is common for IDs
	Section     Section `gorm:"foreignKey:SectionID"` 
}