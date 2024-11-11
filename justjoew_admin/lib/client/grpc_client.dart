import 'package:grpc/grpc_web.dart';
import 'package:justjoew_admin/mapper/object_mapper.dart' as model;
import 'package:justjoew_admin/protos/justjoew.pbgrpc.dart';

class GrpcClient {
  GrpcWebClientChannel? channel;
  AssetControllerClient? stub;
  GrpcClient() {
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

  Future<String> createAsset(List<int> bytes, sectionId) async {
    final request = CreateAssetRequest(blob: bytes, sectionId: sectionId);
    try {
      final response = await stub!.createAsset(request);
      return response.asset.sectionName;
    } catch (e) {
      print('Caught error: $e');
      return 'Error';
    }
  }

    Future<List<model.Section>> getAllSections() async {
    try {
      final response = await stub!.getAllSections(GetAllSectionsRequest());
      return  model.Mapper.mapResponse(response);
    } catch (e) {
      throw('Caught error: $e');
    }
  }

  


  void shutdown() async {
    await channel!.shutdown();
  }
}
