///
//  Generated code. Do not modify.
//  source: cosmos/email/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use queryGetEmailByIdRequestDescriptor instead')
const QueryGetEmailByIdRequest$json = const {
  '1': 'QueryGetEmailByIdRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `QueryGetEmailByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetEmailByIdRequestDescriptor = $convert.base64Decode('ChhRdWVyeUdldEVtYWlsQnlJZFJlcXVlc3QSDgoCaWQYASABKAlSAmlk');
@$core.Deprecated('Use queryGetEmailResponseDescriptor instead')
const QueryGetEmailResponse$json = const {
  '1': 'QueryGetEmailResponse',
  '2': const [
    const {'1': 'Email', '3': 1, '4': 1, '5': 11, '6': '.schrsi.demail.email.Email', '10': 'Email'},
  ],
};

/// Descriptor for `QueryGetEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetEmailResponseDescriptor = $convert.base64Decode('ChVRdWVyeUdldEVtYWlsUmVzcG9uc2USMAoFRW1haWwYASABKAsyGi5zY2hyc2kuZGVtYWlsLmVtYWlsLkVtYWlsUgVFbWFpbA==');
@$core.Deprecated('Use queryAllEmailRequestDescriptor instead')
const QueryAllEmailRequest$json = const {
  '1': 'QueryAllEmailRequest',
  '2': const [
    const {'1': 'pagination', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryAllEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAllEmailRequestDescriptor = $convert.base64Decode('ChRRdWVyeUFsbEVtYWlsUmVxdWVzdBJGCgpwYWdpbmF0aW9uGAEgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryAllEmailResponseDescriptor instead')
const QueryAllEmailResponse$json = const {
  '1': 'QueryAllEmailResponse',
  '2': const [
    const {'1': 'Email', '3': 1, '4': 3, '5': 11, '6': '.schrsi.demail.email.Email', '10': 'Email'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryAllEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAllEmailResponseDescriptor = $convert.base64Decode('ChVRdWVyeUFsbEVtYWlsUmVzcG9uc2USMAoFRW1haWwYASADKAsyGi5zY2hyc2kuZGVtYWlsLmVtYWlsLkVtYWlsUgVFbWFpbBJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
