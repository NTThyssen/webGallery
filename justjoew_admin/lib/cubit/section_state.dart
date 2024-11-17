part of 'section_cubit.dart';

@immutable
sealed class SectionState extends Equatable {}

/// State representing a loading state.
final class SectionLoading extends SectionState {
  @override
  List<Object?> get props => [];
}

/// State representing the ready state with a list of sections.
final class SectionReady extends SectionState {
  final List<Section> sectionList;

  SectionReady(this.sectionList);

  @override
  List<Object?> get props => [sectionList];
}

/// State representing an error state with an error message.
final class SectionError extends SectionState {
  final String errorMessage;

  SectionError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
