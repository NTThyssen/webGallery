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
  static final _$updateAssetOrder = $grpc.ClientMethod<$0.UpdateAssetOrderRequest, $0.UpdateAssetOrderResponse>(
      '/justjoew.asstes.AssetController/UpdateAssetOrder',
      ($0.UpdateAssetOrderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateAssetOrderResponse.fromBuffer(value));
  static final _$deleteSection = $grpc.ClientMethod<$0.DeleteSectionRequest, $0.DeleteSectionResponse>(
      '/justjoew.asstes.AssetController/DeleteSection',
      ($0.DeleteSectionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteSectionResponse.fromBuffer(value));
  static final _$deleteAsset = $grpc.ClientMethod<$0.DeleteAssetRequest, $0.DeleteAssetResponse>(
      '/justjoew.asstes.AssetController/DeleteAsset',
      ($0.DeleteAssetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteAssetResponse.fromBuffer(value));
  static final _$updateSectionInfo = $grpc.ClientMethod<$0.UpdateSectionInfoRequest, $0.UpdateSectionInfoResponse>(
      '/justjoew.asstes.AssetController/UpdateSectionInfo',
      ($0.UpdateSectionInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateSectionInfoResponse.fromBuffer(value));
  static final _$updateSectionOrder = $grpc.ClientMethod<$0.UpdateSectionOrderRequest, $0.UpdateSectionOrderResponse>(
      '/justjoew.asstes.AssetController/UpdateSectionOrder',
      ($0.UpdateSectionOrderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateSectionOrderResponse.fromBuffer(value));
  static final _$sendEmail = $grpc.ClientMethod<$0.SendEmailRequest, $0.Empty>(
      '/justjoew.asstes.AssetController/SendEmail',
      ($0.SendEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

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

  $grpc.ResponseFuture<$0.UpdateAssetOrderResponse> updateAssetOrder($0.UpdateAssetOrderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateAssetOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteSectionResponse> deleteSection($0.DeleteSectionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteSection, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteAssetResponse> deleteAsset($0.DeleteAssetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteAsset, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateSectionInfoResponse> updateSectionInfo($0.UpdateSectionInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateSectionInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateSectionOrderResponse> updateSectionOrder($0.UpdateSectionOrderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateSectionOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> sendEmail($0.SendEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendEmail, request, options: options);
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
        'UpdateAssetOrder',
        updateAssetOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateAssetOrderRequest.fromBuffer(value),
        ($0.UpdateAssetOrderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteSectionRequest, $0.DeleteSectionResponse>(
        'DeleteSection',
        deleteSection_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteSectionRequest.fromBuffer(value),
        ($0.DeleteSectionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteAssetRequest, $0.DeleteAssetResponse>(
        'DeleteAsset',
        deleteAsset_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteAssetRequest.fromBuffer(value),
        ($0.DeleteAssetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateSectionInfoRequest, $0.UpdateSectionInfoResponse>(
        'UpdateSectionInfo',
        updateSectionInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateSectionInfoRequest.fromBuffer(value),
        ($0.UpdateSectionInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateSectionOrderRequest, $0.UpdateSectionOrderResponse>(
        'UpdateSectionOrder',
        updateSectionOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateSectionOrderRequest.fromBuffer(value),
        ($0.UpdateSectionOrderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendEmailRequest, $0.Empty>(
        'SendEmail',
        sendEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendEmailRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
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

  $async.Future<$0.UpdateAssetOrderResponse> updateAssetOrder_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateAssetOrderRequest> request) async {
    return updateAssetOrder(call, await request);
  }

  $async.Future<$0.DeleteSectionResponse> deleteSection_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteSectionRequest> request) async {
    return deleteSection(call, await request);
  }

  $async.Future<$0.DeleteAssetResponse> deleteAsset_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteAssetRequest> request) async {
    return deleteAsset(call, await request);
  }

  $async.Future<$0.UpdateSectionInfoResponse> updateSectionInfo_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateSectionInfoRequest> request) async {
    return updateSectionInfo(call, await request);
  }

  $async.Future<$0.UpdateSectionOrderResponse> updateSectionOrder_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateSectionOrderRequest> request) async {
    return updateSectionOrder(call, await request);
  }

  $async.Future<$0.Empty> sendEmail_Pre($grpc.ServiceCall call, $async.Future<$0.SendEmailRequest> request) async {
    return sendEmail(call, await request);
  }

  $async.Future<$0.GetAllSectionsResonse> getAllSections($grpc.ServiceCall call, $0.GetAllSectionsRequest request);
  $async.Future<$0.CreateSectionResponse> createSection($grpc.ServiceCall call, $0.CreateSectionRequest request);
  $async.Future<$0.CreateAssetResponse> createAsset($grpc.ServiceCall call, $0.CreateAssetRequest request);
  $async.Future<$0.UpdateAssetOrderResponse> updateAssetOrder($grpc.ServiceCall call, $0.UpdateAssetOrderRequest request);
  $async.Future<$0.DeleteSectionResponse> deleteSection($grpc.ServiceCall call, $0.DeleteSectionRequest request);
  $async.Future<$0.DeleteAssetResponse> deleteAsset($grpc.ServiceCall call, $0.DeleteAssetRequest request);
  $async.Future<$0.UpdateSectionInfoResponse> updateSectionInfo($grpc.ServiceCall call, $0.UpdateSectionInfoRequest request);
  $async.Future<$0.UpdateSectionOrderResponse> updateSectionOrder($grpc.ServiceCall call, $0.UpdateSectionOrderRequest request);
  $async.Future<$0.Empty> sendEmail($grpc.ServiceCall call, $0.SendEmailRequest request);
}
