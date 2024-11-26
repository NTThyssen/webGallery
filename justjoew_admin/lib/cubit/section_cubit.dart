import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:justjoew_admin/mapper/object_mapper.dart';
import 'package:justjoew_admin/repository/asset_repository.dart';
import 'package:meta/meta.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  final AssetRepository _assetRepository;
  SectionCubit(this._assetRepository) : super(SectionLoading());

  void getAllSections() async {
    var lists = Mapper.mapResponse(await _assetRepository.getAllSections());

    emit(SectionReady(lists));
  }

  void createAsset(List<int> bytes, int sectionId, String filename) async {
    var asset = await _assetRepository.createAsset(bytes, sectionId, filename);
    getAllSections();
  }

  void deleteAsset(int assetId) async {
    var res = await _assetRepository.deleteAsset(assetId);
    getAllSections();
  }

  void deleteSection(int sectionid) async {
    var res = await _assetRepository.deleteSection(sectionid);
    getAllSections();
  }

  void createSection(String sectioName, String sectionUrl) async {
    var res = await _assetRepository.createSection(sectioName, sectionUrl);

    if (state is SectionReady) {
      var prevState = state as SectionReady;
      prevState.sectionList
          .add(Section(res.id, res.name, const [], res.sectionUrl));
    }
  }

  void updateAssetOrder(int sectionId, int index)async {
    var res = await _assetRepository.updateAssetOrder(sectionId, index);

    getAllSections();
  }
}
