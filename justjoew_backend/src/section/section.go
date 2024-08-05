package section

import "justjoew/backend/src/asset"

type Section struct {
	Id string
	Name string
	SectionList []asset.Asset
}