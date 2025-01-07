import 'package:grpc/grpc_web.dart';
import 'package:justjoew/model/email.dart';
import 'package:justjoew/protos/justjoew.pbgrpc.dart';

class EmailRepository {
  GrpcWebClientChannel? channel;
  AssetControllerClient? stub;
  EmailRepository() {
    channel = GrpcWebClientChannel.xhr(Uri.parse('https://api.justjoew.com'));
    stub = AssetControllerClient(channel!);
  }

  Future<void> sendEmail(Email email) async {
    var request = SendEmailRequest(
        email: email.from, subject: email.subject, message: email.body);
    await stub!.sendEmail(request);
  }
}
