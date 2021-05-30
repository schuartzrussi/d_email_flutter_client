///
//  Generated code. Do not modify.
//  source: cosmos/email/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class MsgCreateEmail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgCreateEmail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'schrsi.demail.email'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creator')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'from')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderSignature', protoName: 'senderSignature')
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderAddressVersion', $pb.PbFieldType.OU6, protoName: 'senderAddressVersion', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subject')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'body')
    ..pPS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attachments')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'replyTo', protoName: 'replyTo')
    ..pPS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trackIds', protoName: 'trackIds')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sendedAt', protoName: 'sendedAt')
    ..pPS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'decryptionKeys', protoName: 'decryptionKeys')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'previousDecryptionKey', protoName: 'previousDecryptionKey')
    ..hasRequiredFields = false
  ;

  MsgCreateEmail._() : super();
  factory MsgCreateEmail({
    $core.String? creator,
    $core.String? from,
    $core.String? to,
    $core.String? senderSignature,
    $fixnum.Int64? senderAddressVersion,
    $core.String? subject,
    $core.String? body,
    $core.Iterable<$core.String>? attachments,
    $core.String? replyTo,
    $core.Iterable<$core.String>? trackIds,
    $core.String? sendedAt,
    $core.Iterable<$core.String>? decryptionKeys,
    $core.String? previousDecryptionKey,
  }) {
    final _result = create();
    if (creator != null) {
      _result.creator = creator;
    }
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to = to;
    }
    if (senderSignature != null) {
      _result.senderSignature = senderSignature;
    }
    if (senderAddressVersion != null) {
      _result.senderAddressVersion = senderAddressVersion;
    }
    if (subject != null) {
      _result.subject = subject;
    }
    if (body != null) {
      _result.body = body;
    }
    if (attachments != null) {
      _result.attachments.addAll(attachments);
    }
    if (replyTo != null) {
      _result.replyTo = replyTo;
    }
    if (trackIds != null) {
      _result.trackIds.addAll(trackIds);
    }
    if (sendedAt != null) {
      _result.sendedAt = sendedAt;
    }
    if (decryptionKeys != null) {
      _result.decryptionKeys.addAll(decryptionKeys);
    }
    if (previousDecryptionKey != null) {
      _result.previousDecryptionKey = previousDecryptionKey;
    }
    return _result;
  }
  factory MsgCreateEmail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgCreateEmail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgCreateEmail clone() => MsgCreateEmail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgCreateEmail copyWith(void Function(MsgCreateEmail) updates) => super.copyWith((message) => updates(message as MsgCreateEmail)) as MsgCreateEmail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgCreateEmail create() => MsgCreateEmail._();
  MsgCreateEmail createEmptyInstance() => create();
  static $pb.PbList<MsgCreateEmail> createRepeated() => $pb.PbList<MsgCreateEmail>();
  @$core.pragma('dart2js:noInline')
  static MsgCreateEmail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgCreateEmail>(create);
  static MsgCreateEmail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get creator => $_getSZ(0);
  @$pb.TagNumber(1)
  set creator($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreator() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreator() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get from => $_getSZ(1);
  @$pb.TagNumber(2)
  set from($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get to => $_getSZ(2);
  @$pb.TagNumber(3)
  set to($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get senderSignature => $_getSZ(3);
  @$pb.TagNumber(4)
  set senderSignature($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSenderSignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearSenderSignature() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get senderAddressVersion => $_getI64(4);
  @$pb.TagNumber(5)
  set senderAddressVersion($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSenderAddressVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearSenderAddressVersion() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get subject => $_getSZ(5);
  @$pb.TagNumber(6)
  set subject($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSubject() => $_has(5);
  @$pb.TagNumber(6)
  void clearSubject() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get body => $_getSZ(6);
  @$pb.TagNumber(7)
  set body($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBody() => $_has(6);
  @$pb.TagNumber(7)
  void clearBody() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.String> get attachments => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get replyTo => $_getSZ(8);
  @$pb.TagNumber(9)
  set replyTo($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasReplyTo() => $_has(8);
  @$pb.TagNumber(9)
  void clearReplyTo() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get trackIds => $_getList(9);

  @$pb.TagNumber(11)
  $core.String get sendedAt => $_getSZ(10);
  @$pb.TagNumber(11)
  set sendedAt($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSendedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearSendedAt() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.String> get decryptionKeys => $_getList(11);

  @$pb.TagNumber(13)
  $core.String get previousDecryptionKey => $_getSZ(12);
  @$pb.TagNumber(13)
  set previousDecryptionKey($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasPreviousDecryptionKey() => $_has(12);
  @$pb.TagNumber(13)
  void clearPreviousDecryptionKey() => clearField(13);
}

class MsgCreateEmailResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgCreateEmailResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'schrsi.demail.email'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  MsgCreateEmailResponse._() : super();
  factory MsgCreateEmailResponse({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory MsgCreateEmailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgCreateEmailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgCreateEmailResponse clone() => MsgCreateEmailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgCreateEmailResponse copyWith(void Function(MsgCreateEmailResponse) updates) => super.copyWith((message) => updates(message as MsgCreateEmailResponse)) as MsgCreateEmailResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgCreateEmailResponse create() => MsgCreateEmailResponse._();
  MsgCreateEmailResponse createEmptyInstance() => create();
  static $pb.PbList<MsgCreateEmailResponse> createRepeated() => $pb.PbList<MsgCreateEmailResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgCreateEmailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgCreateEmailResponse>(create);
  static MsgCreateEmailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

