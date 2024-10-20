part of 'section_cubit.dart';

@immutable
sealed class SectionState extends Equatable {}

final class SectionLoading extends SectionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



final class SectionReady extends SectionState {

  final List<Section> sectionList;

  SectionReady(this.sectionList);
  
  @override
  // TODO: implement props
  List<Object?> get props => [sectionList];

  

}


