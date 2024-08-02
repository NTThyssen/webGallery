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
};

/// Descriptor for `GetAllSectionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllSectionsRequestDescriptor = $convert.base64Decode(
    'ChVHZXRBbGxTZWN0aW9uc1JlcXVlc3Q=');

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
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'assetList', '3': 3, '4': 3, '5': 11, '6': '.justjoew.asstes.Asset', '10': 'assetList'},
  ],
};

/// Descriptor for `Section`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sectionDescriptor = $convert.base64Decode(
    'CgdTZWN0aW9uEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEjQKCWFzc2V0TG'
    'lzdBgDIAMoCzIWLmp1c3Rqb2V3LmFzc3Rlcy5Bc3NldFIJYXNzZXRMaXN0');

@$core.Deprecated('Use createSectionRequestDescriptor instead')
const CreateSectionRequest$json = {
  '1': 'CreateSectionRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `CreateSectionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSectionRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVTZWN0aW9uUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1l');

@$core.Deprecated('Use createSectionResponseDescriptor instead')
const CreateSectionResponse$json = {
  '1': 'CreateSectionResponse',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `CreateSectionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSectionResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVTZWN0aW9uUmVzcG9uc2USEgoEbmFtZRgBIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use assetDescriptor instead')
const Asset$json = {
  '1': 'Asset',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'sectionName', '3': 2, '4': 1, '5': 9, '10': 'sectionName'},
    {'1': 'blobPath', '3': 3, '4': 1, '5': 9, '10': 'blobPath'},
    {'1': 'orderIndex', '3': 4, '4': 1, '5': 5, '10': 'orderIndex'},
    {'1': 'sectionId', '3': 5, '4': 1, '5': 5, '10': 'sectionId'},
  ],
};

/// Descriptor for `Asset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetDescriptor = $convert.base64Decode(
    'CgVBc3NldBIOCgJpZBgBIAEoCVICaWQSIAoLc2VjdGlvbk5hbWUYAiABKAlSC3NlY3Rpb25OYW'
    '1lEhoKCGJsb2JQYXRoGAMgASgJUghibG9iUGF0aBIeCgpvcmRlckluZGV4GAQgASgFUgpvcmRl'
    'ckluZGV4EhwKCXNlY3Rpb25JZBgFIAEoBVIJc2VjdGlvbklk');

@$core.Deprecated('Use createAssetRequestDescriptor instead')
const CreateAssetRequest$json = {
  '1': 'CreateAssetRequest',
  '2': [
    {'1': 'sectionName', '3': 1, '4': 1, '5': 9, '10': 'sectionName'},
    {'1': 'blob', '3': 2, '4': 1, '5': 12, '10': 'blob'},
  ],
};

/// Descriptor for `CreateAssetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAssetRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVBc3NldFJlcXVlc3QSIAoLc2VjdGlvbk5hbWUYASABKAlSC3NlY3Rpb25OYW1lEh'
    'IKBGJsb2IYAiABKAxSBGJsb2I=');

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
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'orderIndex', '3': 2, '4': 1, '5': 5, '10': 'orderIndex'},
  ],
};

/// Descriptor for `UpdateAssetOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAssetOrderRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVBc3NldE9yZGVyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSHgoKb3JkZXJJbmRleB'
    'gCIAEoBVIKb3JkZXJJbmRleA==');

@$core.Deprecated('Use updateAssetOrderResponseDescriptor instead')
const UpdateAssetOrderResponse$json = {
  '1': 'UpdateAssetOrderResponse',
  '2': [
    {'1': 'newOrderIndex', '3': 1, '4': 1, '5': 5, '10': 'newOrderIndex'},
  ],
};

/// Descriptor for `UpdateAssetOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAssetOrderResponseDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVBc3NldE9yZGVyUmVzcG9uc2USJAoNbmV3T3JkZXJJbmRleBgBIAEoBVINbmV3T3'
    'JkZXJJbmRleA==');

