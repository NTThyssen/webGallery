package repository

import "gorm.io/gorm"

type Section struct {
	gorm.Model
	Id          uint   `gorm:"primaryKey;autoIncrement"`
	Name        string
	SectionList []Asset
}