//
//  Generated code. Do not modify.
//  source: justjoew.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetAllSectionsRequest extends $pb.GeneratedMessage {
  factory GetAllSectionsRequest() => create();
  GetAllSectionsRequest._() : super();
  factory GetAllSectionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllSectionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllSectionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllSectionsRequest clone() => GetAllSectionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllSectionsRequest copyWith(void Function(GetAllSectionsRequest) updates) => super.copyWith((message) => updates(message as GetAllSectionsRequest)) as GetAllSectionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllSectionsRequest create() => GetAllSectionsRequest._();
  GetAllSectionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetAllSectionsRequest> createRepeated() => $pb.PbList<GetAllSectionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAllSectionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllSectionsRequest>(create);
  static GetAllSectionsRequest? _defaultInstance;
}

class GetAllSectionsResonse extends $pb.GeneratedMessage {
  factory GetAllSectionsResonse({
    $core.Iterable<Section>? sections,
  }) {
    final $result = create();
    if (sections != null) {
      $result.sections.addAll(sections);
    }
    return $result;
  }
  GetAllSectionsResonse._() : super();
  factory GetAllSectionsResonse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllSectionsResonse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllSectionsResonse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..pc<Section>(1, _omitFieldNames ? '' : 'sections', $pb.PbFieldType.PM, subBuilder: Section.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllSectionsResonse clone() => GetAllSectionsResonse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllSectionsResonse copyWith(void Function(GetAllSectionsResonse) updates) => super.copyWith((message) => updates(message as GetAllSectionsResonse)) as GetAllSectionsResonse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllSectionsResonse create() => GetAllSectionsResonse._();
  GetAllSectionsResonse createEmptyInstance() => create();
  static $pb.PbList<GetAllSectionsResonse> createRepeated() => $pb.PbList<GetAllSectionsResonse>();
  @$core.pragma('dart2js:noInline')
  static GetAllSectionsResonse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllSectionsResonse>(create);
  static GetAllSectionsResonse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Section> get sections => $_getList(0);
}

class Section extends $pb.GeneratedMessage {
  factory Section({
    $core.String? id,
    $core.String? name,
    $core.Iterable<Asset>? assetList,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (assetList != null) {
      $result.assetList.addAll(assetList);
    }
    return $result;
  }
  Section._() : super();
  factory Section.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Section.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Section', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pc<Asset>(3, _omitFieldNames ? '' : 'assetList', $pb.PbFieldType.PM, protoName: 'assetList', subBuilder: Asset.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Section clone() => Section()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Section copyWith(void Function(Section) updates) => super.copyWith((message) => updates(message as Section)) as Section;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Section create() => Section._();
  Section createEmptyInstance() => create();
  static $pb.PbList<Section> createRepeated() => $pb.PbList<Section>();
  @$core.pragma('dart2js:noInline')
  static Section getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Section>(create);
  static Section? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Asset> get assetList => $_getList(2);
}

class CreateSectionRequest extends $pb.GeneratedMessage {
  factory CreateSectionRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  CreateSectionRequest._() : super();
  factory CreateSectionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSectionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSectionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSectionRequest clone() => CreateSectionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSectionRequest copyWith(void Function(CreateSectionRequest) updates) => super.copyWith((message) => updates(message as CreateSectionRequest)) as CreateSectionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSectionRequest create() => CreateSectionRequest._();
  CreateSectionRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSectionRequest> createRepeated() => $pb.PbList<CreateSectionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSectionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSectionRequest>(create);
  static CreateSectionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class CreateSectionResponse extends $pb.GeneratedMessage {
  factory CreateSectionResponse({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  CreateSectionResponse._() : super();
  factory CreateSectionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSectionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSectionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSectionResponse clone() => CreateSectionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSectionResponse copyWith(void Function(CreateSectionResponse) updates) => super.copyWith((message) => updates(message as CreateSectionResponse)) as CreateSectionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSectionResponse create() => CreateSectionResponse._();
  CreateSectionResponse createEmptyInstance() => create();
  static $pb.PbList<CreateSectionResponse> createRepeated() => $pb.PbList<CreateSectionResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateSectionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSectionResponse>(create);
  static CreateSectionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class Asset extends $pb.GeneratedMessage {
  factory Asset({
    $core.int? id,
    $core.String? sectionName,
    $core.String? blobPath,
    $core.int? orderIndex,
    $core.int? sectionId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (sectionName != null) {
      $result.sectionName = sectionName;
    }
    if (blobPath != null) {
      $result.blobPath = blobPath;
    }
    if (orderIndex != null) {
      $result.orderIndex = orderIndex;
    }
    if (sectionId != null) {
      $result.sectionId = sectionId;
    }
    return $result;
  }
  Asset._() : super();
  factory Asset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Asset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Asset', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'sectionName', protoName: 'sectionName')
    ..aOS(3, _omitFieldNames ? '' : 'blobPath', protoName: 'blobPath')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'orderIndex', $pb.PbFieldType.O3, protoName: 'orderIndex')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'sectionId', $pb.PbFieldType.O3, protoName: 'sectionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Asset clone() => Asset()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Asset copyWith(void Function(Asset) updates) => super.copyWith((message) => updates(message as Asset)) as Asset;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Asset create() => Asset._();
  Asset createEmptyInstance() => create();
  static $pb.PbList<Asset> createRepeated() => $pb.PbList<Asset>();
  @$core.pragma('dart2js:noInline')
  static Asset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Asset>(create);
  static Asset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sectionName => $_getSZ(1);
  @$pb.TagNumber(2)
  set sectionName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSectionName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSectionName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get blobPath => $_getSZ(2);
  @$pb.TagNumber(3)
  set blobPath($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBlobPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlobPath() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get orderIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set orderIndex($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrderIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrderIndex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sectionId => $_getIZ(4);
  @$pb.TagNumber(5)
  set sectionId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSectionId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSectionId() => clearField(5);
}

/// The request message containing the user's name.
class CreateAssetRequest extends $pb.GeneratedMessage {
  factory CreateAssetRequest({
    $core.int? sectionId,
    $core.List<$core.int>? blob,
  }) {
    final $result = create();
    if (sectionId != null) {
      $result.sectionId = sectionId;
    }
    if (blob != null) {
      $result.blob = blob;
    }
    return $result;
  }
  CreateAssetRequest._() : super();
  factory CreateAssetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAssetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAssetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'sectionId', $pb.PbFieldType.OU3, protoName: 'sectionId')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'blob', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAssetRequest clone() => CreateAssetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAssetRequest copyWith(void Function(CreateAssetRequest) updates) => super.copyWith((message) => updates(message as CreateAssetRequest)) as CreateAssetRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAssetRequest create() => CreateAssetRequest._();
  CreateAssetRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAssetRequest> createRepeated() => $pb.PbList<CreateAssetRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAssetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAssetRequest>(create);
  static CreateAssetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sectionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set sectionId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSectionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get blob => $_getN(1);
  @$pb.TagNumber(2)
  set blob($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlob() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlob() => clearField(2);
}

/// The response message containing the greetings
class CreateAssetResponse extends $pb.GeneratedMessage {
  factory CreateAssetResponse({
    Asset? asset,
  }) {
    final $result = create();
    if (asset != null) {
      $result.asset = asset;
    }
    return $result;
  }
  CreateAssetResponse._() : super();
  factory CreateAssetResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAssetResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAssetResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..aOM<Asset>(1, _omitFieldNames ? '' : 'asset', subBuilder: Asset.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAssetResponse clone() => CreateAssetResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAssetResponse copyWith(void Function(CreateAssetResponse) updates) => super.copyWith((message) => updates(message as CreateAssetResponse)) as CreateAssetResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAssetResponse create() => CreateAssetResponse._();
  CreateAssetResponse createEmptyInstance() => create();
  static $pb.PbList<CreateAssetResponse> createRepeated() => $pb.PbList<CreateAssetResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateAssetResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAssetResponse>(create);
  static CreateAssetResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Asset get asset => $_getN(0);
  @$pb.TagNumber(1)
  set asset(Asset v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAsset() => $_has(0);
  @$pb.TagNumber(1)
  void clearAsset() => clearField(1);
  @$pb.TagNumber(1)
  Asset ensureAsset() => $_ensure(0);
}

class UpdateAssetOrderRequest extends $pb.GeneratedMessage {
  factory UpdateAssetOrderRequest({
    $core.int? id,
    $core.int? orderIndex,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (orderIndex != null) {
      $result.orderIndex = orderIndex;
    }
    return $result;
  }
  UpdateAssetOrderRequest._() : super();
  factory UpdateAssetOrderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAssetOrderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAssetOrderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'orderIndex', $pb.PbFieldType.OU3, protoName: 'orderIndex')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAssetOrderRequest clone() => UpdateAssetOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAssetOrderRequest copyWith(void Function(UpdateAssetOrderRequest) updates) => super.copyWith((message) => updates(message as UpdateAssetOrderRequest)) as UpdateAssetOrderRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAssetOrderRequest create() => UpdateAssetOrderRequest._();
  UpdateAssetOrderRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAssetOrderRequest> createRepeated() => $pb.PbList<UpdateAssetOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAssetOrderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAssetOrderRequest>(create);
  static UpdateAssetOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get orderIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set orderIndex($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrderIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderIndex() => clearField(2);
}

class UpdateAssetOrderResponse extends $pb.GeneratedMessage {
  factory UpdateAssetOrderResponse({
    $core.int? newOrderIndex,
  }) {
    final $result = create();
    if (newOrderIndex != null) {
      $result.newOrderIndex = newOrderIndex;
    }
    return $result;
  }
  UpdateAssetOrderResponse._() : super();
  factory UpdateAssetOrderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAssetOrderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAssetOrderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'newOrderIndex', $pb.PbFieldType.OU3, protoName: 'newOrderIndex')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAssetOrderResponse clone() => UpdateAssetOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAssetOrderResponse copyWith(void Function(UpdateAssetOrderResponse) updates) => super.copyWith((message) => updates(message as UpdateAssetOrderResponse)) as UpdateAssetOrderResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAssetOrderResponse create() => UpdateAssetOrderResponse._();
  UpdateAssetOrderResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateAssetOrderResponse> createRepeated() => $pb.PbList<UpdateAssetOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateAssetOrderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAssetOrderResponse>(create);
  static UpdateAssetOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get newOrderIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set newOrderIndex($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNewOrderIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewOrderIndex() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
