//
//  Generated code. Do not modify.
//  source: justjoew.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getAllSectionsRequestDescriptor instead')
const GetAllSectionsRequest$json = {
  '1': 'GetAllSectionsRequest',
  '2': [
    {'1': 'aspectRatio', '3': 1, '4': 1, '5': 13, '10': 'aspectRatio'},
  ],
};

/// Descriptor for `GetAllSectionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllSectionsRequestDescriptor = $convert.base64Decode(
    'ChVHZXRBbGxTZWN0aW9uc1JlcXVlc3QSIAoLYXNwZWN0UmF0aW8YASABKA1SC2FzcGVjdFJhdG'
    'lv');

@$core.Deprecated('Use getAllSectionsResonseDescriptor instead')
const GetAllSectionsResonse$json = {
  '1': 'GetAllSectionsResonse',
  '2': [
    {'1': 'sections', '3': 1, '4': 3, '5': 11, '6': '.justjoew.asstes.Section', '10': 'sections'},
  ],
};

/// Descriptor for `GetAllSectionsResonse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllSectionsResonseDescriptor = $convert.base64Decode(
    'ChVHZXRBbGxTZWN0aW9uc1Jlc29uc2USNAoIc2VjdGlvbnMYASADKAsyGC5qdXN0am9ldy5hc3'
    'N0ZXMuU2VjdGlvblIIc2VjdGlvbnM=');

@$core.Deprecated('Use sectionDescriptor instead')
const Section$json = {
  '1': 'Section',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'assetList', '3': 3, '4': 3, '5': 11, '6': '.justjoew.asstes.Asset', '10': 'assetList'},
    {'1': 'sectionUrl', '3': 4, '4': 1, '5': 9, '10': 'sectionUrl'},
  ],
};

/// Descriptor for `Section`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sectionDescriptor = $convert.base64Decode(
    'CgdTZWN0aW9uEg4KAmlkGAEgASgNUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEjQKCWFzc2V0TG'
    'lzdBgDIAMoCzIWLmp1c3Rqb2V3LmFzc3Rlcy5Bc3NldFIJYXNzZXRMaXN0Eh4KCnNlY3Rpb25V'
    'cmwYBCABKAlSCnNlY3Rpb25Vcmw=');

@$core.Deprecated('Use createSectionRequestDescriptor instead')
const CreateSectionRequest$json = {
  '1': 'CreateSectionRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'sectionURL', '3': 2, '4': 1, '5': 9, '10': 'sectionURL'},
  ],
};

/// Descriptor for `CreateSectionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSectionRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVTZWN0aW9uUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEh4KCnNlY3Rpb25VUk'
    'wYAiABKAlSCnNlY3Rpb25VUkw=');

@$core.Deprecated('Use createSectionResponseDescriptor instead')
const CreateSectionResponse$json = {
  '1': 'CreateSectionResponse',
  '2': [
    {'1': 'section', '3': 1, '4': 1, '5': 11, '6': '.justjoew.asstes.Section', '10': 'section'},
  ],
};

/// Descriptor for `CreateSectionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSectionResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVTZWN0aW9uUmVzcG9uc2USMgoHc2VjdGlvbhgBIAEoCzIYLmp1c3Rqb2V3LmFzc3'
    'Rlcy5TZWN0aW9uUgdzZWN0aW9u');

@$core.Deprecated('Use assetDescriptor instead')
const Asset$json = {
  '1': 'Asset',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'sectionName', '3': 2, '4': 1, '5': 9, '10': 'sectionName'},
    {'1': 'blobPath', '3': 3, '4': 1, '5': 9, '10': 'blobPath'},
    {'1': 'orderIndex', '3': 4, '4': 1, '5': 13, '10': 'orderIndex'},
    {'1': 'sectionId', '3': 5, '4': 1, '5': 13, '10': 'sectionId'},
  ],
};

/// Descriptor for `Asset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetDescriptor = $convert.base64Decode(
    'CgVBc3NldBIOCgJpZBgBIAEoDVICaWQSIAoLc2VjdGlvbk5hbWUYAiABKAlSC3NlY3Rpb25OYW'
    '1lEhoKCGJsb2JQYXRoGAMgASgJUghibG9iUGF0aBIeCgpvcmRlckluZGV4GAQgASgNUgpvcmRl'
    'ckluZGV4EhwKCXNlY3Rpb25JZBgFIAEoDVIJc2VjdGlvbklk');

@$core.Deprecated('Use createAssetRequestDescriptor instead')
const CreateAssetRequest$json = {
  '1': 'CreateAssetRequest',
  '2': [
    {'1': 'sectionId', '3': 1, '4': 1, '5': 13, '10': 'sectionId'},
    {'1': 'blob', '3': 2, '4': 1, '5': 12, '10': 'blob'},
    {'1': 'filename', '3': 3, '4': 1, '5': 9, '10': 'filename'},
  ],
};

/// Descriptor for `CreateAssetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAssetRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVBc3NldFJlcXVlc3QSHAoJc2VjdGlvbklkGAEgASgNUglzZWN0aW9uSWQSEgoEYm'
    'xvYhgCIAEoDFIEYmxvYhIaCghmaWxlbmFtZRgDIAEoCVIIZmlsZW5hbWU=');

@$core.Deprecated('Use createAssetResponseDescriptor instead')
const CreateAssetResponse$json = {
  '1': 'CreateAssetResponse',
  '2': [
    {'1': 'asset', '3': 1, '4': 1, '5': 11, '6': '.justjoew.asstes.Asset', '10': 'asset'},
  ],
};

/// Descriptor for `CreateAssetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAssetResponseDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVBc3NldFJlc3BvbnNlEiwKBWFzc2V0GAEgASgLMhYuanVzdGpvZXcuYXNzdGVzLk'
    'Fzc2V0UgVhc3NldA==');

@$core.Deprecated('Use updateAssetOrderRequestDescriptor instead')
const UpdateAssetOrderRequest$json = {
  '1': 'UpdateAssetOrderRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'orderIndex', '3': 2, '4': 1, '5': 13, '10': 'orderIndex'},
  ],
};

/// Descriptor for `UpdateAssetOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAssetOrderRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVBc3NldE9yZGVyUmVxdWVzdBIOCgJpZBgBIAEoDVICaWQSHgoKb3JkZXJJbmRleB'
    'gCIAEoDVIKb3JkZXJJbmRleA==');

@$core.Deprecated('Use updateAssetOrderResponseDescriptor instead')
const UpdateAssetOrderResponse$json = {
  '1': 'UpdateAssetOrderResponse',
  '2': [
    {'1': 'newOrderIndex', '3': 1, '4': 1, '5': 13, '10': 'newOrderIndex'},
  ],
};

/// Descriptor for `UpdateAssetOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAssetOrderResponseDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVBc3NldE9yZGVyUmVzcG9uc2USJAoNbmV3T3JkZXJJbmRleBgBIAEoDVINbmV3T3'
    'JkZXJJbmRleA==');

@$core.Deprecated('Use deleteSectionResponseDescriptor instead')
const DeleteSectionResponse$json = {
  '1': 'DeleteSectionResponse',
};

/// Descriptor for `DeleteSectionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSectionResponseDescriptor = $convert.base64Decode(
    'ChVEZWxldGVTZWN0aW9uUmVzcG9uc2U=');

@$core.Deprecated('Use deleteSectionRequestDescriptor instead')
const DeleteSectionRequest$json = {
  '1': 'DeleteSectionRequest',
  '2': [
    {'1': 'sectionId', '3': 1, '4': 1, '5': 13, '10': 'sectionId'},
  ],
};

/// Descriptor for `DeleteSectionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSectionRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVTZWN0aW9uUmVxdWVzdBIcCglzZWN0aW9uSWQYASABKA1SCXNlY3Rpb25JZA==');

@$core.Deprecated('Use deleteAssetRequestDescriptor instead')
const DeleteAssetRequest$json = {
  '1': 'DeleteAssetRequest',
  '2': [
    {'1': 'assetId', '3': 1, '4': 1, '5': 13, '10': 'assetId'},
  ],
};

/// Descriptor for `DeleteAssetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAssetRequestDescriptor = $convert.base64Decode(
    'ChJEZWxldGVBc3NldFJlcXVlc3QSGAoHYXNzZXRJZBgBIAEoDVIHYXNzZXRJZA==');

@$core.Deprecated('Use deleteAssetResponseDescriptor instead')
const DeleteAssetResponse$json = {
  '1': 'DeleteAssetResponse',
};

/// Descriptor for `DeleteAssetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAssetResponseDescriptor = $convert.base64Decode(
    'ChNEZWxldGVBc3NldFJlc3BvbnNl');

