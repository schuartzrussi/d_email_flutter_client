///
//  Generated code. Do not modify.
//  source: cosmos/address/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use msgCreateAddressDescriptor instead')
const MsgCreateAddress$json = const {
  '1': 'MsgCreateAddress',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'pubKey', '3': 3, '4': 1, '5': 9, '10': 'pubKey'},
  ],
};

/// Descriptor for `MsgCreateAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateAddressDescriptor = $convert.base64Decode('ChBNc2dDcmVhdGVBZGRyZXNzEhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISEgoEbmFtZRgCIAEoCVIEbmFtZRIWCgZwdWJLZXkYAyABKAlSBnB1YktleQ==');
@$core.Deprecated('Use msgCreateAddressResponseDescriptor instead')
const MsgCreateAddressResponse$json = const {
  '1': 'MsgCreateAddressResponse',
  '2': const [
    const {'1': 'trackID', '3': 1, '4': 1, '5': 4, '10': 'trackID'},
  ],
};

/// Descriptor for `MsgCreateAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateAddressResponseDescriptor = $convert.base64Decode('ChhNc2dDcmVhdGVBZGRyZXNzUmVzcG9uc2USGAoHdHJhY2tJRBgBIAEoBFIHdHJhY2tJRA==');
@$core.Deprecated('Use msgUpdateAddressDescriptor instead')
const MsgUpdateAddress$json = const {
  '1': 'MsgUpdateAddress',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'pubKey', '3': 3, '4': 1, '5': 9, '10': 'pubKey'},
  ],
};

/// Descriptor for `MsgUpdateAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgUpdateAddressDescriptor = $convert.base64Decode('ChBNc2dVcGRhdGVBZGRyZXNzEhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISEgoEbmFtZRgCIAEoCVIEbmFtZRIWCgZwdWJLZXkYAyABKAlSBnB1YktleQ==');
@$core.Deprecated('Use msgUpdateAddressResponseDescriptor instead')
const MsgUpdateAddressResponse$json = const {
  '1': 'MsgUpdateAddressResponse',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 4, '10': 'version'},
  ],
};

/// Descriptor for `MsgUpdateAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgUpdateAddressResponseDescriptor = $convert.base64Decode('ChhNc2dVcGRhdGVBZGRyZXNzUmVzcG9uc2USGAoHdmVyc2lvbhgBIAEoBFIHdmVyc2lvbg==');
