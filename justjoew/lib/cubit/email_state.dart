part of 'email_cubit.dart';

sealed class EmailState extends Equatable {
  const EmailState();

  @override
  List<Object> get props => [];
}

final class EmailInitial extends EmailState {}


final class EmailSent extends EmailState {}


final class EmailError extends EmailState {}
