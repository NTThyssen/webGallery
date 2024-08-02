package repository

import "gorm.io/gorm"

type Section struct {
	gorm.Model
	Name        string
}