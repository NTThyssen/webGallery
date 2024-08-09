package repository

import "gorm.io/gorm"

type Section struct {
	gorm.Model
	Name        string
	AssetList   []Asset `gorm:"foreignKey:SectionID"`
}