//
//  Generated code. Do not modify.
//  source: justjoew.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'justjoew.pb.dart' as $0;

export 'justjoew.pb.dart';

@$pb.GrpcServiceName('justjoew.asstes.AssetController')
class AssetControllerClient extends $grpc.Client {
  static final _$getAllSections = $grpc.ClientMethod<$0.GetAllSectionsRequest, $0.GetAllSectionsResonse>(
      '/justjoew.asstes.AssetController/GetAllSections',
      ($0.GetAllSectionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetAllSectionsResonse.fromBuffer(value));
  static final _$createSection = $grpc.ClientMethod<$0.CreateSectionRequest, $0.CreateSectionResponse>(
      '/justjoew.asstes.AssetController/CreateSection',
      ($0.CreateSectionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateSectionResponse.fromBuffer(value));
  static final _$createAsset = $grpc.ClientMethod<$0.CreateAssetRequest, $0.CreateAssetResponse>(
      '/justjoew.asstes.AssetController/CreateAsset',
      ($0.CreateAssetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateAssetResponse.fromBuffer(value));
  static final _$updateAssetorder = $grpc.ClientMethod<$0.UpdateAssetOrderRequest, $0.UpdateAssetOrderResponse>(
      '/justjoew.asstes.AssetController/UpdateAssetorder',
      ($0.UpdateAssetOrderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateAssetOrderResponse.fromBuffer(value));

  AssetControllerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetAllSectionsResonse> getAllSections($0.GetAllSectionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllSections, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateSectionResponse> createSection($0.CreateSectionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createSection, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateAssetResponse> createAsset($0.CreateAssetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAsset, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateAssetOrderResponse> updateAssetorder($0.UpdateAssetOrderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateAssetorder, request, options: options);
  }
}

@$pb.GrpcServiceName('justjoew.asstes.AssetController')
abstract class AssetControllerServiceBase extends $grpc.Service {
  $core.String get $name => 'justjoew.asstes.AssetController';

  AssetControllerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetAllSectionsRequest, $0.GetAllSectionsResonse>(
        'GetAllSections',
        getAllSections_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAllSectionsRequest.fromBuffer(value),
        ($0.GetAllSectionsResonse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateSectionRequest, $0.CreateSectionResponse>(
        'CreateSection',
        createSection_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateSectionRequest.fromBuffer(value),
        ($0.CreateSectionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateAssetRequest, $0.CreateAssetResponse>(
        'CreateAsset',
        createAsset_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateAssetRequest.fromBuffer(value),
        ($0.CreateAssetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateAssetOrderRequest, $0.UpdateAssetOrderResponse>(
        'UpdateAssetorder',
        updateAssetorder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateAssetOrderRequest.fromBuffer(value),
        ($0.UpdateAssetOrderResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetAllSectionsResonse> getAllSections_Pre($grpc.ServiceCall call, $async.Future<$0.GetAllSectionsRequest> request) async {
    return getAllSections(call, await request);
  }

  $async.Future<$0.CreateSectionResponse> createSection_Pre($grpc.ServiceCall call, $async.Future<$0.CreateSectionRequest> request) async {
    return createSection(call, await request);
  }

  $async.Future<$0.CreateAssetResponse> createAsset_Pre($grpc.ServiceCall call, $async.Future<$0.CreateAssetRequest> request) async {
    return createAsset(call, await request);
  }

  $async.Future<$0.UpdateAssetOrderResponse> updateAssetorder_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateAssetOrderRequest> request) async {
    return updateAssetorder(call, await request);
  }

  $async.Future<$0.GetAllSectionsResonse> getAllSections($grpc.ServiceCall call, $0.GetAllSectionsRequest request);
  $async.Future<$0.CreateSectionResponse> createSection($grpc.ServiceCall call, $0.CreateSectionRequest request);
  $async.Future<$0.CreateAssetResponse> createAsset($grpc.ServiceCall call, $0.CreateAssetRequest request);
  $async.Future<$0.UpdateAssetOrderResponse> updateAssetorder($grpc.ServiceCall call, $0.UpdateAssetOrderRequest request);
}
