package repository

import "gorm.io/gorm"

type Section struct {
	gorm.Model
	Name        string
	SectionUrl string
	OrderIndex uint32
	AssetList   []Asset `gorm:"foreignKey:SectionID"`
}