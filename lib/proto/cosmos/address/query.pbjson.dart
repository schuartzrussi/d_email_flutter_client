///
//  Generated code. Do not modify.
//  source: cosmos/address/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use queryGetAddressByNameRequestDescriptor instead')
const QueryGetAddressByNameRequest$json = const {
  '1': 'QueryGetAddressByNameRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `QueryGetAddressByNameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetAddressByNameRequestDescriptor = $convert.base64Decode('ChxRdWVyeUdldEFkZHJlc3NCeU5hbWVSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');
@$core.Deprecated('Use queryGetAddressByVersionRequestDescriptor instead')
const QueryGetAddressByVersionRequest$json = const {
  '1': 'QueryGetAddressByVersionRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'version', '3': 2, '4': 1, '5': 4, '10': 'version'},
  ],
};

/// Descriptor for `QueryGetAddressByVersionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetAddressByVersionRequestDescriptor = $convert.base64Decode('Ch9RdWVyeUdldEFkZHJlc3NCeVZlcnNpb25SZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSGAoHdmVyc2lvbhgCIAEoBFIHdmVyc2lvbg==');
@$core.Deprecated('Use queryGetAddressResponseDescriptor instead')
const QueryGetAddressResponse$json = const {
  '1': 'QueryGetAddressResponse',
  '2': const [
    const {'1': 'Address', '3': 1, '4': 1, '5': 11, '6': '.schrsi.demail.address.Address', '10': 'Address'},
  ],
};

/// Descriptor for `QueryGetAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetAddressResponseDescriptor = $convert.base64Decode('ChdRdWVyeUdldEFkZHJlc3NSZXNwb25zZRI4CgdBZGRyZXNzGAEgASgLMh4uc2NocnNpLmRlbWFpbC5hZGRyZXNzLkFkZHJlc3NSB0FkZHJlc3M=');
@$core.Deprecated('Use queryAllAddressRequestDescriptor instead')
const QueryAllAddressRequest$json = const {
  '1': 'QueryAllAddressRequest',
  '2': const [
    const {'1': 'pagination', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryAllAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAllAddressRequestDescriptor = $convert.base64Decode('ChZRdWVyeUFsbEFkZHJlc3NSZXF1ZXN0EkYKCnBhZ2luYXRpb24YASABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryAllAddressResponseDescriptor instead')
const QueryAllAddressResponse$json = const {
  '1': 'QueryAllAddressResponse',
  '2': const [
    const {'1': 'Address', '3': 1, '4': 3, '5': 11, '6': '.schrsi.demail.address.Address', '10': 'Address'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryAllAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAllAddressResponseDescriptor = $convert.base64Decode('ChdRdWVyeUFsbEFkZHJlc3NSZXNwb25zZRI4CgdBZGRyZXNzGAEgAygLMh4uc2NocnNpLmRlbWFpbC5hZGRyZXNzLkFkZHJlc3NSB0FkZHJlc3MSRwoKcGFnaW5hdGlvbhgCIAEoCzInLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlc3BvbnNlUgpwYWdpbmF0aW9u');
