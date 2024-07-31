import 'package:grpc/grpc_web.dart';
import 'package:justjoew_admin/generated/justjoew.pbgrpc.dart';

class GrpcClient {
  GrpcWebClientChannel? channel;
  GreeterClient? stub;
  GrpcClient() {
    channel = GrpcWebClientChannel.xhr(Uri.parse('http://localhost:9901'));
    stub = GreeterClient(channel!);
  }

  Future<String> sayHello(String name) async {
    final request = HelloRequest()..name = name;
    try {
      final response = await stub!.sayHello(request);
      return response.message;
    } catch (e) {
      print('Caught error: $e');
      return 'Error';
    }
  }

  void shutdown() async {
    await channel!.shutdown();
  }
}
