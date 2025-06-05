import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:justjoew/mapper/object_mapper.dart';
import 'package:justjoew/repository/portfolio_repository.dart';

import 'package:meta/meta.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  final AssetRepository _assetRepository;
  final int ratio;
  SectionCubit(this._assetRepository, this.ratio) : super(SectionLoading());

  void getAllSections() async {
    var lists =
        Mapper.mapResponse(await _assetRepository.getAllSections(ratio));
    for (var list in lists) {
      //sort each assets list and return the section list with sub sorted lists
      list.assetList.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    }
    lists.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    emit(SectionReady(lists));
  }
}
