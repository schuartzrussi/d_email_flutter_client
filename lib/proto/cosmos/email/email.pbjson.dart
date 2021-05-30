///
//  Generated code. Do not modify.
//  source: cosmos/email/email.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use emailDescriptor instead')
const Email$json = const {
  '1': 'Email',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'from', '3': 3, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'to', '3': 4, '4': 1, '5': 9, '10': 'to'},
    const {'1': 'senderSignature', '3': 5, '4': 1, '5': 9, '10': 'senderSignature'},
    const {'1': 'senderAddressVersion', '3': 6, '4': 1, '5': 4, '10': 'senderAddressVersion'},
    const {'1': 'subject', '3': 7, '4': 1, '5': 9, '10': 'subject'},
    const {'1': 'body', '3': 8, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'attachments', '3': 9, '4': 3, '5': 9, '10': 'attachments'},
    const {'1': 'replyTo', '3': 10, '4': 1, '5': 9, '10': 'replyTo'},
    const {'1': 'trackIds', '3': 11, '4': 3, '5': 9, '10': 'trackIds'},
    const {'1': 'sendedAt', '3': 12, '4': 1, '5': 9, '10': 'sendedAt'},
    const {'1': 'decryptionKeys', '3': 13, '4': 3, '5': 9, '10': 'decryptionKeys'},
    const {'1': 'previousDecryptionKey', '3': 14, '4': 1, '5': 9, '10': 'previousDecryptionKey'},
  ],
};

/// Descriptor for `Email`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailDescriptor = $convert.base64Decode('CgVFbWFpbBIYCgdjcmVhdG9yGAEgASgJUgdjcmVhdG9yEg4KAmlkGAIgASgJUgJpZBISCgRmcm9tGAMgASgJUgRmcm9tEg4KAnRvGAQgASgJUgJ0bxIoCg9zZW5kZXJTaWduYXR1cmUYBSABKAlSD3NlbmRlclNpZ25hdHVyZRIyChRzZW5kZXJBZGRyZXNzVmVyc2lvbhgGIAEoBFIUc2VuZGVyQWRkcmVzc1ZlcnNpb24SGAoHc3ViamVjdBgHIAEoCVIHc3ViamVjdBISCgRib2R5GAggASgJUgRib2R5EiAKC2F0dGFjaG1lbnRzGAkgAygJUgthdHRhY2htZW50cxIYCgdyZXBseVRvGAogASgJUgdyZXBseVRvEhoKCHRyYWNrSWRzGAsgAygJUgh0cmFja0lkcxIaCghzZW5kZWRBdBgMIAEoCVIIc2VuZGVkQXQSJgoOZGVjcnlwdGlvbktleXMYDSADKAlSDmRlY3J5cHRpb25LZXlzEjQKFXByZXZpb3VzRGVjcnlwdGlvbktleRgOIAEoCVIVcHJldmlvdXNEZWNyeXB0aW9uS2V5');
