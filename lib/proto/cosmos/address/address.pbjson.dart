///
//  Generated code. Do not modify.
//  source: cosmos/address/address.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use addressDescriptor instead')
const Address$json = const {
  '1': 'Address',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'pubKey', '3': 3, '4': 1, '5': 9, '10': 'pubKey'},
    const {'1': 'trackID', '3': 4, '4': 1, '5': 4, '10': 'trackID'},
    const {'1': 'version', '3': 5, '4': 1, '5': 4, '10': 'version'},
  ],
};

/// Descriptor for `Address`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addressDescriptor = $convert.base64Decode('CgdBZGRyZXNzEhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISEgoEbmFtZRgCIAEoCVIEbmFtZRIWCgZwdWJLZXkYAyABKAlSBnB1YktleRIYCgd0cmFja0lEGAQgASgEUgd0cmFja0lEEhgKB3ZlcnNpb24YBSABKARSB3ZlcnNpb24=');
