import 'package:grpc/grpc_web.dart';
import 'package:justjoew/protos/justjoew.pbgrpc.dart';

class AssetRepository {
  GrpcWebClientChannel? channel;
  AssetControllerClient? stub;
  AssetRepository() {
    channel = GrpcWebClientChannel.xhr(Uri.parse('https://api.justjoew.com'));
    stub = AssetControllerClient(channel!);
  }

  Future<GetAllSectionsResonse> getAllSections() async {
    try {
      final response =
          await stub!.getAllSections(GetAllSectionsRequest(aspectRatio: 112));
      return response;
    } catch (e) {
      throw ('Caught error: $e');
    }
  }

  void shutdown() async {
    await channel!.shutdown();
  }
}
