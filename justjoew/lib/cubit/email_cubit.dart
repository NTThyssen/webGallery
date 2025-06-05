import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:justjoew/model/email.dart';
import 'package:justjoew/repository/email_repository.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  final EmailRepository _emailRepository;
  EmailCubit(this._emailRepository) : super(EmailInitial());

  void sendEmail(String from, String subject, String body, String name) async {
    var email = Email(from: from, subject: subject, body: body, name: name);
    try {
      await _emailRepository.sendEmail(email);
      emit(EmailSent());
    } catch (e) {
      emit(EmailError());
    }
  }
}
