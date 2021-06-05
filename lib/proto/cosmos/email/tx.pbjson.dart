///
//  Generated code. Do not modify.
//  source: cosmos/email/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use msgCreateEmailDescriptor instead')
const MsgCreateEmail$json = const {
  '1': 'MsgCreateEmail',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'from', '3': 2, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'to', '3': 3, '4': 1, '5': 9, '10': 'to'},
    const {'1': 'senderSignature', '3': 4, '4': 1, '5': 9, '10': 'senderSignature'},
    const {'1': 'senderAddressVersion', '3': 5, '4': 1, '5': 4, '10': 'senderAddressVersion'},
    const {'1': 'subject', '3': 6, '4': 1, '5': 9, '10': 'subject'},
    const {'1': 'body', '3': 7, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'replyTo', '3': 8, '4': 1, '5': 9, '10': 'replyTo'},
    const {'1': 'trackIds', '3': 9, '4': 3, '5': 9, '10': 'trackIds'},
    const {'1': 'sendedAt', '3': 10, '4': 1, '5': 9, '10': 'sendedAt'},
    const {'1': 'decryptionKeys', '3': 11, '4': 3, '5': 9, '10': 'decryptionKeys'},
    const {'1': 'previousDecryptionKey', '3': 12, '4': 1, '5': 9, '10': 'previousDecryptionKey'},
    const {'1': 'id', '3': 13, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `MsgCreateEmail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateEmailDescriptor = $convert.base64Decode('Cg5Nc2dDcmVhdGVFbWFpbBIYCgdjcmVhdG9yGAEgASgJUgdjcmVhdG9yEhIKBGZyb20YAiABKAlSBGZyb20SDgoCdG8YAyABKAlSAnRvEigKD3NlbmRlclNpZ25hdHVyZRgEIAEoCVIPc2VuZGVyU2lnbmF0dXJlEjIKFHNlbmRlckFkZHJlc3NWZXJzaW9uGAUgASgEUhRzZW5kZXJBZGRyZXNzVmVyc2lvbhIYCgdzdWJqZWN0GAYgASgJUgdzdWJqZWN0EhIKBGJvZHkYByABKAlSBGJvZHkSGAoHcmVwbHlUbxgIIAEoCVIHcmVwbHlUbxIaCgh0cmFja0lkcxgJIAMoCVIIdHJhY2tJZHMSGgoIc2VuZGVkQXQYCiABKAlSCHNlbmRlZEF0EiYKDmRlY3J5cHRpb25LZXlzGAsgAygJUg5kZWNyeXB0aW9uS2V5cxI0ChVwcmV2aW91c0RlY3J5cHRpb25LZXkYDCABKAlSFXByZXZpb3VzRGVjcnlwdGlvbktleRIOCgJpZBgNIAEoCVICaWQ=');
@$core.Deprecated('Use msgCreateEmailResponseDescriptor instead')
const MsgCreateEmailResponse$json = const {
  '1': 'MsgCreateEmailResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `MsgCreateEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateEmailResponseDescriptor = $convert.base64Decode('ChZNc2dDcmVhdGVFbWFpbFJlc3BvbnNlEg4KAmlkGAEgASgJUgJpZA==');
