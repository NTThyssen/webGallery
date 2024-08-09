

import 'package:justjoew_admin/protos/justjoew.pb.dart';

class Section {

    int id;
    String name;
    List<Asset> assetList;

    Section(this.id, this.name, this.assetList);

}


class Asset {
  int id;
  String sectionName;
  String bloburl;
  int orderIndex;
  int sectionId;

  Asset(this.bloburl, this.id, this.orderIndex, this.sectionId, this.sectionName);
}


class Mapper{

    static List<Section> mapResponse(GetAllSectionsResonse response){
      var sectionList = new List<Section>.empty();
      for (var sectionEle in response.sections) {
        var assetList = new List<Asset>.empty();
        for (var assetEle in sectionEle.assetList) {
           assetList.add(Asset(assetEle.blobPath, assetEle.id, assetEle.orderIndex, assetEle.sectionId, assetEle.sectionName));
        }
         sectionList.add(Section(sectionEle.id, sectionEle.name,assetList));
      }

      return sectionList;
    }

}