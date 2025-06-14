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
    {'1': 'orderIndex', '3': 5, '4': 1, '5': 13, '10': 'orderIndex'},
  ],
};

/// Descriptor for `Section`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sectionDescriptor = $convert.base64Decode(
    'CgdTZWN0aW9uEg4KAmlkGAEgASgNUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEjQKCWFzc2V0TG'
    'lzdBgDIAMoCzIWLmp1c3Rqb2V3LmFzc3Rlcy5Bc3NldFIJYXNzZXRMaXN0Eh4KCnNlY3Rpb25V'
    'cmwYBCABKAlSCnNlY3Rpb25VcmwSHgoKb3JkZXJJbmRleBgFIAEoDVIKb3JkZXJJbmRleA==');

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

@$core.Deprecated('Use updateSectionOrderRequestDescriptor instead')
const UpdateSectionOrderRequest$json = {
  '1': 'UpdateSectionOrderRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'orderIndex', '3': 2, '4': 1, '5': 13, '10': 'orderIndex'},
  ],
};

/// Descriptor for `UpdateSectionOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSectionOrderRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVTZWN0aW9uT3JkZXJSZXF1ZXN0Eg4KAmlkGAEgASgNUgJpZBIeCgpvcmRlckluZG'
    'V4GAIgASgNUgpvcmRlckluZGV4');

@$core.Deprecated('Use updateSectionOrderResponseDescriptor instead')
const UpdateSectionOrderResponse$json = {
  '1': 'UpdateSectionOrderResponse',
  '2': [
    {'1': 'newOrderIndex', '3': 1, '4': 1, '5': 13, '10': 'newOrderIndex'},
  ],
};

/// Descriptor for `UpdateSectionOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSectionOrderResponseDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVTZWN0aW9uT3JkZXJSZXNwb25zZRIkCg1uZXdPcmRlckluZGV4GAEgASgNUg1uZX'
    'dPcmRlckluZGV4');

@$core.Deprecated('Use updateSectionInfoRequestDescriptor instead')
const UpdateSectionInfoRequest$json = {
  '1': 'UpdateSectionInfoRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'sectionName', '3': 2, '4': 1, '5': 9, '10': 'sectionName'},
    {'1': 'sectionUrl', '3': 3, '4': 1, '5': 9, '10': 'sectionUrl'},
  ],
};

/// Descriptor for `UpdateSectionInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSectionInfoRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVTZWN0aW9uSW5mb1JlcXVlc3QSDgoCaWQYASABKA1SAmlkEiAKC3NlY3Rpb25OYW'
    '1lGAIgASgJUgtzZWN0aW9uTmFtZRIeCgpzZWN0aW9uVXJsGAMgASgJUgpzZWN0aW9uVXJs');

@$core.Deprecated('Use updateSectionInfoResponseDescriptor instead')
const UpdateSectionInfoResponse$json = {
  '1': 'UpdateSectionInfoResponse',
  '2': [
    {'1': 'sectionName', '3': 1, '4': 1, '5': 9, '10': 'sectionName'},
    {'1': 'sectionUrl', '3': 2, '4': 1, '5': 9, '10': 'sectionUrl'},
  ],
};

/// Descriptor for `UpdateSectionInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSectionInfoResponseDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVTZWN0aW9uSW5mb1Jlc3BvbnNlEiAKC3NlY3Rpb25OYW1lGAEgASgJUgtzZWN0aW'
    '9uTmFtZRIeCgpzZWN0aW9uVXJsGAIgASgJUgpzZWN0aW9uVXJs');

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

@$core.Deprecated('Use sendEmailRequestDescriptor instead')
const SendEmailRequest$json = {
  '1': 'SendEmailRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'subject', '3': 2, '4': 1, '5': 9, '10': 'subject'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `SendEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendEmailRequestDescriptor = $convert.base64Decode(
    'ChBTZW5kRW1haWxSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIYCgdzdWJqZWN0GAIgAS'
    'gJUgdzdWJqZWN0EhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2USEgoEbmFtZRgEIAEoCVIEbmFt'
    'ZQ==');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

