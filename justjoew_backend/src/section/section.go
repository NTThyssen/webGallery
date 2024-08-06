package section

import "justjoew/backend/src/asset"

type Section struct {
	Id string
	Name string
	SectionOrderIndex uint
	SectionList []asset.Asset
}