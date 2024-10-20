import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:justjoew/mapper/object_mapper.dart';
import 'package:justjoew/repository/portfolio_repository.dart';

import 'package:meta/meta.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  final AssetRepository _assetRepository;
  SectionCubit(this._assetRepository) : super(SectionLoading());

  void getAllSections() async {
    var lists = Mapper.mapResponse(await _assetRepository.getAllSections());

    emit(SectionReady(lists));
  }
}
