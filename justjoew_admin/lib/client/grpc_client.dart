import 'package:grpc/grpc_web.dart';
import 'package:justjoew_admin/protos/justjoew.pbgrpc.dart';

class GrpcClient {
  GrpcWebClientChannel? channel;
  AssetControllerClient? stub;
  GrpcClient() {
    channel = GrpcWebClientChannel.xhr(Uri.parse('https://api.justjoew.com'));
    stub = AssetControllerClient(channel!);
  }

  Future<String> sayHello(String name) async {
    final request = CreateSectionRequest()..name = name;
    try {
      final response = await stub!.createSection(request);
      return response.name;
    } catch (e) {
      print('Caught error: $e');
      return 'Error';
    }
  }

  void shutdown() async {
    await channel!.shutdown();
  }
}
