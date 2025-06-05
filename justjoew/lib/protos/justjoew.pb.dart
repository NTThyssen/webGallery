//
//  Generated code. Do not modify.
//  source: justjoew.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetAllSectionsRequest extends $pb.GeneratedMessage {
  factory GetAllSectionsRequest({
    $core.int? aspectRatio,
  }) {
    final result = create();
    if (aspectRatio != null) result.aspectRatio = aspectRatio;
    return result;
  }

  GetAllSectionsRequest._();

  factory GetAllSectionsRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetAllSectionsRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllSectionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'aspectRatio', $pb.PbFieldType.OU3, protoName: 'aspectRatio')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllSectionsRequest clone() => GetAllSectionsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllSectionsRequest copyWith(void Function(GetAllSectionsRequest) updates) => super.copyWith((message) => updates(message as GetAllSectionsRequest)) as GetAllSectionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllSectionsRequest create() => GetAllSectionsRequest._();
  @$core.override
  GetAllSectionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetAllSectionsRequest> createRepeated() => $pb.PbList<GetAllSectionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAllSectionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllSectionsRequest>(create);
  static GetAllSectionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get aspectRatio => $_getIZ(0);
  @$pb.TagNumber(1)
  set aspectRatio($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAspectRatio() => $_has(0);
  @$pb.TagNumber(1)
  void clearAspectRatio() => $_clearField(1);
}

class GetAllSectionsResonse extends $pb.GeneratedMessage {
  factory GetAllSectionsResonse({
    $core.Iterable<Section>? sections,
  }) {
    final result = create();
    if (sections != null) result.sections.addAll(sections);
    return result;
  }

  GetAllSectionsResonse._();

  factory GetAllSectionsResonse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetAllSectionsResonse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAllSectionsResonse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..pc<Section>(1, _omitFieldNames ? '' : 'sections', $pb.PbFieldType.PM, subBuilder: Section.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllSectionsResonse clone() => GetAllSectionsResonse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllSectionsResonse copyWith(void Function(GetAllSectionsResonse) updates) => super.copyWith((message) => updates(message as GetAllSectionsResonse)) as GetAllSectionsResonse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllSectionsResonse create() => GetAllSectionsResonse._();
  @$core.override
  GetAllSectionsResonse createEmptyInstance() => create();
  static $pb.PbList<GetAllSectionsResonse> createRepeated() => $pb.PbList<GetAllSectionsResonse>();
  @$core.pragma('dart2js:noInline')
  static GetAllSectionsResonse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllSectionsResonse>(create);
  static GetAllSectionsResonse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Section> get sections => $_getList(0);
}

class Section extends $pb.GeneratedMessage {
  factory Section({
    $core.int? id,
    $core.String? name,
    $core.Iterable<Asset>? assetList,
    $core.String? sectionUrl,
    $core.int? orderIndex,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (assetList != null) result.assetList.addAll(assetList);
    if (sectionUrl != null) result.sectionUrl = sectionUrl;
    if (orderIndex != null) result.orderIndex = orderIndex;
    return result;
  }

  Section._();

  factory Section.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory Section.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Section', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pc<Asset>(3, _omitFieldNames ? '' : 'assetList', $pb.PbFieldType.PM, protoName: 'assetList', subBuilder: Asset.create)
    ..aOS(4, _omitFieldNames ? '' : 'sectionUrl', protoName: 'sectionUrl')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'orderIndex', $pb.PbFieldType.OU3, protoName: 'orderIndex')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Section clone() => Section()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Section copyWith(void Function(Section) updates) => super.copyWith((message) => updates(message as Section)) as Section;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Section create() => Section._();
  @$core.override
  Section createEmptyInstance() => create();
  static $pb.PbList<Section> createRepeated() => $pb.PbList<Section>();
  @$core.pragma('dart2js:noInline')
  static Section getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Section>(create);
  static Section? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<Asset> get assetList => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get sectionUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set sectionUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSectionUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearSectionUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get orderIndex => $_getIZ(4);
  @$pb.TagNumber(5)
  set orderIndex($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOrderIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderIndex() => $_clearField(5);
}

class CreateSectionRequest extends $pb.GeneratedMessage {
  factory CreateSectionRequest({
    $core.String? name,
    $core.String? sectionURL,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (sectionURL != null) result.sectionURL = sectionURL;
    return result;
  }

  CreateSectionRequest._();

  factory CreateSectionRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateSectionRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSectionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'sectionURL', protoName: 'sectionURL')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSectionRequest clone() => CreateSectionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSectionRequest copyWith(void Function(CreateSectionRequest) updates) => super.copyWith((message) => updates(message as CreateSectionRequest)) as CreateSectionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSectionRequest create() => CreateSectionRequest._();
  @$core.override
  CreateSectionRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSectionRequest> createRepeated() => $pb.PbList<CreateSectionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSectionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSectionRequest>(create);
  static CreateSectionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get sectionURL => $_getSZ(1);
  @$pb.TagNumber(2)
  set sectionURL($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSectionURL() => $_has(1);
  @$pb.TagNumber(2)
  void clearSectionURL() => $_clearField(2);
}

class CreateSectionResponse extends $pb.GeneratedMessage {
  factory CreateSectionResponse({
    Section? section,
  }) {
    final result = create();
    if (section != null) result.section = section;
    return result;
  }

  CreateSectionResponse._();

  factory CreateSectionResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateSectionResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSectionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..aOM<Section>(1, _omitFieldNames ? '' : 'section', subBuilder: Section.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSectionResponse clone() => CreateSectionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSectionResponse copyWith(void Function(CreateSectionResponse) updates) => super.copyWith((message) => updates(message as CreateSectionResponse)) as CreateSectionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSectionResponse create() => CreateSectionResponse._();
  @$core.override
  CreateSectionResponse createEmptyInstance() => create();
  static $pb.PbList<CreateSectionResponse> createRepeated() => $pb.PbList<CreateSectionResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateSectionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSectionResponse>(create);
  static CreateSectionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Section get section => $_getN(0);
  @$pb.TagNumber(1)
  set section(Section value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSection() => $_has(0);
  @$pb.TagNumber(1)
  void clearSection() => $_clearField(1);
  @$pb.TagNumber(1)
  Section ensureSection() => $_ensure(0);
}

class Asset extends $pb.GeneratedMessage {
  factory Asset({
    $core.int? id,
    $core.String? sectionName,
    $core.String? blobPath,
    $core.int? orderIndex,
    $core.int? sectionId,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (sectionName != null) result.sectionName = sectionName;
    if (blobPath != null) result.blobPath = blobPath;
    if (orderIndex != null) result.orderIndex = orderIndex;
    if (sectionId != null) result.sectionId = sectionId;
    return result;
  }

  Asset._();

  factory Asset.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory Asset.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Asset', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'sectionName', protoName: 'sectionName')
    ..aOS(3, _omitFieldNames ? '' : 'blobPath', protoName: 'blobPath')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'orderIndex', $pb.PbFieldType.OU3, protoName: 'orderIndex')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'sectionId', $pb.PbFieldType.OU3, protoName: 'sectionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset clone() => Asset()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset copyWith(void Function(Asset) updates) => super.copyWith((message) => updates(message as Asset)) as Asset;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Asset create() => Asset._();
  @$core.override
  Asset createEmptyInstance() => create();
  static $pb.PbList<Asset> createRepeated() => $pb.PbList<Asset>();
  @$core.pragma('dart2js:noInline')
  static Asset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Asset>(create);
  static Asset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get sectionName => $_getSZ(1);
  @$pb.TagNumber(2)
  set sectionName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSectionName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSectionName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get blobPath => $_getSZ(2);
  @$pb.TagNumber(3)
  set blobPath($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBlobPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlobPath() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get orderIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set orderIndex($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOrderIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrderIndex() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get sectionId => $_getIZ(4);
  @$pb.TagNumber(5)
  set sectionId($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSectionId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSectionId() => $_clearField(5);
}

/// The request message containing the user's name.
class CreateAssetRequest extends $pb.GeneratedMessage {
  factory CreateAssetRequest({
    $core.int? sectionId,
    $core.List<$core.int>? blob,
    $core.String? filename,
  }) {
    final result = create();
    if (sectionId != null) result.sectionId = sectionId;
    if (blob != null) result.blob = blob;
    if (filename != null) result.filename = filename;
    return result;
  }

  CreateAssetRequest._();

  factory CreateAssetRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateAssetRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAssetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'sectionId', $pb.PbFieldType.OU3, protoName: 'sectionId')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'blob', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'filename')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAssetRequest clone() => CreateAssetRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAssetRequest copyWith(void Function(CreateAssetRequest) updates) => super.copyWith((message) => updates(message as CreateAssetRequest)) as CreateAssetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAssetRequest create() => CreateAssetRequest._();
  @$core.override
  CreateAssetRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAssetRequest> createRepeated() => $pb.PbList<CreateAssetRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAssetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAssetRequest>(create);
  static CreateAssetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sectionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set sectionId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSectionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get blob => $_getN(1);
  @$pb.TagNumber(2)
  set blob($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBlob() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlob() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get filename => $_getSZ(2);
  @$pb.TagNumber(3)
  set filename($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFilename() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilename() => $_clearField(3);
}

/// The response message containing the greetings
class CreateAssetResponse extends $pb.GeneratedMessage {
  factory CreateAssetResponse({
    Asset? asset,
  }) {
    final result = create();
    if (asset != null) result.asset = asset;
    return result;
  }

  CreateAssetResponse._();

  factory CreateAssetResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateAssetResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAssetResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..aOM<Asset>(1, _omitFieldNames ? '' : 'asset', subBuilder: Asset.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAssetResponse clone() => CreateAssetResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateAssetResponse copyWith(void Function(CreateAssetResponse) updates) => super.copyWith((message) => updates(message as CreateAssetResponse)) as CreateAssetResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAssetResponse create() => CreateAssetResponse._();
  @$core.override
  CreateAssetResponse createEmptyInstance() => create();
  static $pb.PbList<CreateAssetResponse> createRepeated() => $pb.PbList<CreateAssetResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateAssetResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAssetResponse>(create);
  static CreateAssetResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Asset get asset => $_getN(0);
  @$pb.TagNumber(1)
  set asset(Asset value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAsset() => $_has(0);
  @$pb.TagNumber(1)
  void clearAsset() => $_clearField(1);
  @$pb.TagNumber(1)
  Asset ensureAsset() => $_ensure(0);
}

class UpdateAssetOrderRequest extends $pb.GeneratedMessage {
  factory UpdateAssetOrderRequest({
    $core.int? id,
    $core.int? orderIndex,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (orderIndex != null) result.orderIndex = orderIndex;
    return result;
  }

  UpdateAssetOrderRequest._();

  factory UpdateAssetOrderRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateAssetOrderRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAssetOrderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'orderIndex', $pb.PbFieldType.OU3, protoName: 'orderIndex')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAssetOrderRequest clone() => UpdateAssetOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAssetOrderRequest copyWith(void Function(UpdateAssetOrderRequest) updates) => super.copyWith((message) => updates(message as UpdateAssetOrderRequest)) as UpdateAssetOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAssetOrderRequest create() => UpdateAssetOrderRequest._();
  @$core.override
  UpdateAssetOrderRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAssetOrderRequest> createRepeated() => $pb.PbList<UpdateAssetOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAssetOrderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAssetOrderRequest>(create);
  static UpdateAssetOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get orderIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set orderIndex($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOrderIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderIndex() => $_clearField(2);
}

class UpdateSectionOrderRequest extends $pb.GeneratedMessage {
  factory UpdateSectionOrderRequest({
    $core.int? id,
    $core.int? orderIndex,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (orderIndex != null) result.orderIndex = orderIndex;
    return result;
  }

  UpdateSectionOrderRequest._();

  factory UpdateSectionOrderRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateSectionOrderRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSectionOrderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'orderIndex', $pb.PbFieldType.OU3, protoName: 'orderIndex')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSectionOrderRequest clone() => UpdateSectionOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSectionOrderRequest copyWith(void Function(UpdateSectionOrderRequest) updates) => super.copyWith((message) => updates(message as UpdateSectionOrderRequest)) as UpdateSectionOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSectionOrderRequest create() => UpdateSectionOrderRequest._();
  @$core.override
  UpdateSectionOrderRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSectionOrderRequest> createRepeated() => $pb.PbList<UpdateSectionOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSectionOrderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSectionOrderRequest>(create);
  static UpdateSectionOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get orderIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set orderIndex($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOrderIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderIndex() => $_clearField(2);
}

class UpdateSectionOrderResponse extends $pb.GeneratedMessage {
  factory UpdateSectionOrderResponse({
    $core.int? newOrderIndex,
  }) {
    final result = create();
    if (newOrderIndex != null) result.newOrderIndex = newOrderIndex;
    return result;
  }

  UpdateSectionOrderResponse._();

  factory UpdateSectionOrderResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateSectionOrderResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSectionOrderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'newOrderIndex', $pb.PbFieldType.OU3, protoName: 'newOrderIndex')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSectionOrderResponse clone() => UpdateSectionOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSectionOrderResponse copyWith(void Function(UpdateSectionOrderResponse) updates) => super.copyWith((message) => updates(message as UpdateSectionOrderResponse)) as UpdateSectionOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSectionOrderResponse create() => UpdateSectionOrderResponse._();
  @$core.override
  UpdateSectionOrderResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSectionOrderResponse> createRepeated() => $pb.PbList<UpdateSectionOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSectionOrderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSectionOrderResponse>(create);
  static UpdateSectionOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get newOrderIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set newOrderIndex($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNewOrderIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewOrderIndex() => $_clearField(1);
}

class UpdateSectionInfoRequest extends $pb.GeneratedMessage {
  factory UpdateSectionInfoRequest({
    $core.int? id,
    $core.String? sectionName,
    $core.String? sectionUrl,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (sectionName != null) result.sectionName = sectionName;
    if (sectionUrl != null) result.sectionUrl = sectionUrl;
    return result;
  }

  UpdateSectionInfoRequest._();

  factory UpdateSectionInfoRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateSectionInfoRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSectionInfoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'sectionName', protoName: 'sectionName')
    ..aOS(3, _omitFieldNames ? '' : 'sectionUrl', protoName: 'sectionUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSectionInfoRequest clone() => UpdateSectionInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSectionInfoRequest copyWith(void Function(UpdateSectionInfoRequest) updates) => super.copyWith((message) => updates(message as UpdateSectionInfoRequest)) as UpdateSectionInfoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSectionInfoRequest create() => UpdateSectionInfoRequest._();
  @$core.override
  UpdateSectionInfoRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSectionInfoRequest> createRepeated() => $pb.PbList<UpdateSectionInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSectionInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSectionInfoRequest>(create);
  static UpdateSectionInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get sectionName => $_getSZ(1);
  @$pb.TagNumber(2)
  set sectionName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSectionName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSectionName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get sectionUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set sectionUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSectionUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearSectionUrl() => $_clearField(3);
}

class UpdateSectionInfoResponse extends $pb.GeneratedMessage {
  factory UpdateSectionInfoResponse({
    $core.String? sectionName,
    $core.String? sectionUrl,
  }) {
    final result = create();
    if (sectionName != null) result.sectionName = sectionName;
    if (sectionUrl != null) result.sectionUrl = sectionUrl;
    return result;
  }

  UpdateSectionInfoResponse._();

  factory UpdateSectionInfoResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateSectionInfoResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSectionInfoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sectionName', protoName: 'sectionName')
    ..aOS(2, _omitFieldNames ? '' : 'sectionUrl', protoName: 'sectionUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSectionInfoResponse clone() => UpdateSectionInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSectionInfoResponse copyWith(void Function(UpdateSectionInfoResponse) updates) => super.copyWith((message) => updates(message as UpdateSectionInfoResponse)) as UpdateSectionInfoResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSectionInfoResponse create() => UpdateSectionInfoResponse._();
  @$core.override
  UpdateSectionInfoResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSectionInfoResponse> createRepeated() => $pb.PbList<UpdateSectionInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSectionInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSectionInfoResponse>(create);
  static UpdateSectionInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sectionName => $_getSZ(0);
  @$pb.TagNumber(1)
  set sectionName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSectionName() => $_has(0);
  @$pb.TagNumber(1)
  void clearSectionName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get sectionUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set sectionUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSectionUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearSectionUrl() => $_clearField(2);
}

class UpdateAssetOrderResponse extends $pb.GeneratedMessage {
  factory UpdateAssetOrderResponse({
    $core.int? newOrderIndex,
  }) {
    final result = create();
    if (newOrderIndex != null) result.newOrderIndex = newOrderIndex;
    return result;
  }

  UpdateAssetOrderResponse._();

  factory UpdateAssetOrderResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateAssetOrderResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAssetOrderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'newOrderIndex', $pb.PbFieldType.OU3, protoName: 'newOrderIndex')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAssetOrderResponse clone() => UpdateAssetOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateAssetOrderResponse copyWith(void Function(UpdateAssetOrderResponse) updates) => super.copyWith((message) => updates(message as UpdateAssetOrderResponse)) as UpdateAssetOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAssetOrderResponse create() => UpdateAssetOrderResponse._();
  @$core.override
  UpdateAssetOrderResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateAssetOrderResponse> createRepeated() => $pb.PbList<UpdateAssetOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateAssetOrderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAssetOrderResponse>(create);
  static UpdateAssetOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get newOrderIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set newOrderIndex($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNewOrderIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewOrderIndex() => $_clearField(1);
}

class DeleteSectionResponse extends $pb.GeneratedMessage {
  factory DeleteSectionResponse() => create();

  DeleteSectionResponse._();

  factory DeleteSectionResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeleteSectionResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSectionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSectionResponse clone() => DeleteSectionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSectionResponse copyWith(void Function(DeleteSectionResponse) updates) => super.copyWith((message) => updates(message as DeleteSectionResponse)) as DeleteSectionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSectionResponse create() => DeleteSectionResponse._();
  @$core.override
  DeleteSectionResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteSectionResponse> createRepeated() => $pb.PbList<DeleteSectionResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteSectionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSectionResponse>(create);
  static DeleteSectionResponse? _defaultInstance;
}

class DeleteSectionRequest extends $pb.GeneratedMessage {
  factory DeleteSectionRequest({
    $core.int? sectionId,
  }) {
    final result = create();
    if (sectionId != null) result.sectionId = sectionId;
    return result;
  }

  DeleteSectionRequest._();

  factory DeleteSectionRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeleteSectionRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSectionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'sectionId', $pb.PbFieldType.OU3, protoName: 'sectionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSectionRequest clone() => DeleteSectionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSectionRequest copyWith(void Function(DeleteSectionRequest) updates) => super.copyWith((message) => updates(message as DeleteSectionRequest)) as DeleteSectionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSectionRequest create() => DeleteSectionRequest._();
  @$core.override
  DeleteSectionRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSectionRequest> createRepeated() => $pb.PbList<DeleteSectionRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSectionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSectionRequest>(create);
  static DeleteSectionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sectionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set sectionId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSectionId() => $_clearField(1);
}

class DeleteAssetRequest extends $pb.GeneratedMessage {
  factory DeleteAssetRequest({
    $core.int? assetId,
  }) {
    final result = create();
    if (assetId != null) result.assetId = assetId;
    return result;
  }

  DeleteAssetRequest._();

  factory DeleteAssetRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeleteAssetRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAssetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'assetId', $pb.PbFieldType.OU3, protoName: 'assetId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAssetRequest clone() => DeleteAssetRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAssetRequest copyWith(void Function(DeleteAssetRequest) updates) => super.copyWith((message) => updates(message as DeleteAssetRequest)) as DeleteAssetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAssetRequest create() => DeleteAssetRequest._();
  @$core.override
  DeleteAssetRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteAssetRequest> createRepeated() => $pb.PbList<DeleteAssetRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteAssetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAssetRequest>(create);
  static DeleteAssetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get assetId => $_getIZ(0);
  @$pb.TagNumber(1)
  set assetId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAssetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetId() => $_clearField(1);
}

class DeleteAssetResponse extends $pb.GeneratedMessage {
  factory DeleteAssetResponse() => create();

  DeleteAssetResponse._();

  factory DeleteAssetResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeleteAssetResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAssetResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAssetResponse clone() => DeleteAssetResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteAssetResponse copyWith(void Function(DeleteAssetResponse) updates) => super.copyWith((message) => updates(message as DeleteAssetResponse)) as DeleteAssetResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAssetResponse create() => DeleteAssetResponse._();
  @$core.override
  DeleteAssetResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteAssetResponse> createRepeated() => $pb.PbList<DeleteAssetResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteAssetResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAssetResponse>(create);
  static DeleteAssetResponse? _defaultInstance;
}

class SendEmailRequest extends $pb.GeneratedMessage {
  factory SendEmailRequest({
    $core.String? email,
    $core.String? subject,
    $core.String? message,
    $core.String? name,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (subject != null) result.subject = subject;
    if (message != null) result.message = message;
    if (name != null) result.name = name;
    return result;
  }

  SendEmailRequest._();

  factory SendEmailRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SendEmailRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SendEmailRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'subject')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendEmailRequest clone() => SendEmailRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendEmailRequest copyWith(void Function(SendEmailRequest) updates) => super.copyWith((message) => updates(message as SendEmailRequest)) as SendEmailRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendEmailRequest create() => SendEmailRequest._();
  @$core.override
  SendEmailRequest createEmptyInstance() => create();
  static $pb.PbList<SendEmailRequest> createRepeated() => $pb.PbList<SendEmailRequest>();
  @$core.pragma('dart2js:noInline')
  static SendEmailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendEmailRequest>(create);
  static SendEmailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get subject => $_getSZ(1);
  @$pb.TagNumber(2)
  set subject($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSubject() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubject() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();

  Empty._();

  factory Empty.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory Empty.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'justjoew.asstes'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  @$core.override
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
