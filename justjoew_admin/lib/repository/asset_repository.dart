import 'package:grpc/grpc_web.dart';
import 'package:justjoew_admin/protos/justjoew.pbgrpc.dart';

class AssetRepository {
  GrpcWebClientChannel? channel;
  AssetControllerClient? stub;
  AssetRepository() {
    channel = GrpcWebClientChannel.xhr(Uri.parse('https://api.justjoew.com'));
    stub = AssetControllerClient(channel!);
  }

  Future<String> createSection(String name) async {
    final request = CreateSectionRequest()..name = name;
    try {
      final response = await stub!.createSection(request);
      return response.name;
    } catch (e) {
      print('Caught error: $e');
      return 'Error';
    }
  }

  Future<Asset> createAsset(
      List<int> bytes, int sectionId, String filename) async {
    final request = CreateAssetRequest(
        blob: bytes, sectionId: sectionId, filename: filename);
    try {
      final response = await stub!.createAsset(request);
      return response.asset;
    } catch (e) {
      print('Caught error: $e');
      throw Exception("failed to create asset");
    }
  }

  Future<GetAllSectionsResonse> getAllSections() async {
    try {
      final response =
          await stub!.getAllSections(GetAllSectionsRequest(aspectRatio: 512));
      return response;
    } catch (e) {
      throw ('Caught error: $e');
    }
  }

  void shutdown() async {
    await channel!.shutdown();
  }
}
