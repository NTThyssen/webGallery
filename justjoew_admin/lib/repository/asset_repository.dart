import 'package:grpc/grpc_web.dart';
import 'package:justjoew_admin/protos/justjoew.pbgrpc.dart';

class AssetRepository {
  GrpcWebClientChannel? channel;
  AssetControllerClient? stub;
  AssetRepository() {
    channel = GrpcWebClientChannel.xhr(Uri.parse('https://api.justjoew.com'));
    stub = AssetControllerClient(channel!);
  }

  Future<Section> createSection(String name, sectionUrl) async {
    final request = CreateSectionRequest(name: name, sectionURL: sectionUrl);
    try {
      final response = await stub!.createSection(request);
      return response.section;
    } catch (e) {
      print('Caught error: $e');
     throw Error();
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


    Future<int> updateAssetOrder(
     int sectionId, int orderIndex) async {
    final request = UpdateAssetOrderRequest(
        id:sectionId, orderIndex: orderIndex);
    try {
      final response = await stub!.updateAssetorder(request);
      return response.newOrderIndex;
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

  Future<DeleteSectionResponse> deleteSection(int sectionId) async {
    try {
      final response =
          await stub!.deleteSection(DeleteSectionRequest(sectionId: sectionId));
      return response;
    } catch (e) {
      throw ('Caught error: $e');
    }
  }

  Future<DeleteAssetResponse> deleteAsset(int assetId) async {
    try {
      final response =
          await stub!.deleteAsset(DeleteAssetRequest(assetId: assetId));
      return response;
    } catch (e) {
      throw ('Caught error: $e');
    }
  }

  void shutdown() async {
    await channel!.shutdown();
  }
}
