import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:justjoew_admin/mapper/object_mapper.dart';
import 'package:justjoew_admin/repository/asset_repository.dart';
import 'package:meta/meta.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  final  AssetRepository _assetRepository;
  SectionCubit(this._assetRepository) : super(SectionLoading());

    void getAllSections() async {

    var lists = Mapper.mapResponse(await _assetRepository.getAllSections());

     emit(SectionReady(lists));


    }


    void createAsset(List<int> bytes, int sectionId, String filename) async {

     var asset  = await _assetRepository.createAsset(bytes, sectionId, filename);
      getAllSections();
    }

    void createSection(String sectioName, String text, ) async {


      if(state is SectionReady){
          var prevState = state as SectionReady;
          prevState.sectionList.add(Section(prevState.sectionList.length, sectioName, const []));
      }

      await _assetRepository.createSection(sectioName);
    }

  }
