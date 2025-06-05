import 'package:equatable/equatable.dart';
import 'package:justjoew/protos/justjoew.pb.dart';

// ignore: must_be_immutable
class Section extends Equatable {
  int id;
  String name;
  List<Asset> assetList;
  String sectionlUrl;
  int orderIndex = 0;

  Section(this.id, this.name, this.assetList, this.sectionlUrl, this.orderIndex);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, assetList, sectionlUrl, orderIndex];
}

// ignore: must_be_immutable
class Asset extends Equatable {
  int id;
  String sectionName;
  String bloburl;
  int orderIndex;
  int sectionId;

  Asset(
      this.bloburl, this.id, this.orderIndex, this.sectionId, this.sectionName);

  @override
  // TODO: implement props
  List<Object?> get props => [id, sectionName, bloburl, orderIndex, sectionId];
}

class Mapper {
  static List<Section> mapResponse(GetAllSectionsResonse response) {
    var sectionList = new List<Section>.empty(growable: true);
    for (var sectionEle in response.sections) {
      var assetList = new List<Asset>.empty(growable: true);
      for (var assetEle in sectionEle.assetList) {
        assetList.add(Asset(assetEle.blobPath, assetEle.id, assetEle.orderIndex,
            assetEle.sectionId, assetEle.sectionName));
      }
      sectionList.add(Section(sectionEle.id, sectionEle.name, assetList, sectionEle.sectionUrl, sectionEle.orderIndex));
    }

    return sectionList;
  }
}
