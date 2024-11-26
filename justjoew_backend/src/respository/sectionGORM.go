package repository

import "gorm.io/gorm"

type Section struct {
	gorm.Model
	Name        string
	SectionUrl string
	AssetList   []Asset `gorm:"foreignKey:SectionID"`
}