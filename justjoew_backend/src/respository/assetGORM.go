package repository

import "gorm.io/gorm"

type Asset struct {
	gorm.Model 
	Id          uint   `gorm:"primaryKey;autoIncrement"`
	SectionName string
	BlobPath    string
	OrderIndex  int32
	SectionId   int32
}