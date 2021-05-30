///
//  Generated code. Do not modify.
//  source: cosmos/email/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'email.pb.dart' as $2;
import '../base/query/v1beta1/pagination.pb.dart' as $3;

class QueryGetEmailByIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetEmailByIdRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'schrsi.demail.email'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  QueryGetEmailByIdRequest._() : super();
  factory QueryGetEmailByIdRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory QueryGetEmailByIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetEmailByIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetEmailByIdRequest clone() => QueryGetEmailByIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetEmailByIdRequest copyWith(void Function(QueryGetEmailByIdRequest) updates) => super.copyWith((message) => updates(message as QueryGetEmailByIdRequest)) as QueryGetEmailByIdRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetEmailByIdRequest create() => QueryGetEmailByIdRequest._();
  QueryGetEmailByIdRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetEmailByIdRequest> createRepeated() => $pb.PbList<QueryGetEmailByIdRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetEmailByIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetEmailByIdRequest>(create);
  static QueryGetEmailByIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class QueryGetEmailResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetEmailResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'schrsi.demail.email'), createEmptyInstance: create)
    ..aOM<$2.Email>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Email', protoName: 'Email', subBuilder: $2.Email.create)
    ..hasRequiredFields = false
  ;

  QueryGetEmailResponse._() : super();
  factory QueryGetEmailResponse({
    $2.Email? email,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory QueryGetEmailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetEmailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetEmailResponse clone() => QueryGetEmailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetEmailResponse copyWith(void Function(QueryGetEmailResponse) updates) => super.copyWith((message) => updates(message as QueryGetEmailResponse)) as QueryGetEmailResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetEmailResponse create() => QueryGetEmailResponse._();
  QueryGetEmailResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetEmailResponse> createRepeated() => $pb.PbList<QueryGetEmailResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetEmailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetEmailResponse>(create);
  static QueryGetEmailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Email get email => $_getN(0);
  @$pb.TagNumber(1)
  set email($2.Email v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
  @$pb.TagNumber(1)
  $2.Email ensureEmail() => $_ensure(0);
}

class QueryAllEmailRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAllEmailRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'schrsi.demail.email'), createEmptyInstance: create)
    ..aOM<$3.PageRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $3.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryAllEmailRequest._() : super();
  factory QueryAllEmailRequest({
    $3.PageRequest? pagination,
  }) {
    final _result = create();
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryAllEmailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAllEmailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAllEmailRequest clone() => QueryAllEmailRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAllEmailRequest copyWith(void Function(QueryAllEmailRequest) updates) => super.copyWith((message) => updates(message as QueryAllEmailRequest)) as QueryAllEmailRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAllEmailRequest create() => QueryAllEmailRequest._();
  QueryAllEmailRequest createEmptyInstance() => create();
  static $pb.PbList<QueryAllEmailRequest> createRepeated() => $pb.PbList<QueryAllEmailRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryAllEmailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAllEmailRequest>(create);
  static QueryAllEmailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $3.PageRequest get pagination => $_getN(0);
  @$pb.TagNumber(1)
  set pagination($3.PageRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPagination() => $_has(0);
  @$pb.TagNumber(1)
  void clearPagination() => clearField(1);
  @$pb.TagNumber(1)
  $3.PageRequest ensurePagination() => $_ensure(0);
}

class QueryAllEmailResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAllEmailResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'schrsi.demail.email'), createEmptyInstance: create)
    ..pc<$2.Email>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Email', $pb.PbFieldType.PM, protoName: 'Email', subBuilder: $2.Email.create)
    ..aOM<$3.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $3.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryAllEmailResponse._() : super();
  factory QueryAllEmailResponse({
    $core.Iterable<$2.Email>? email,
    $3.PageResponse? pagination,
  }) {
    final _result = create();
    if (email != null) {
      _result.email.addAll(email);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryAllEmailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAllEmailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAllEmailResponse clone() => QueryAllEmailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAllEmailResponse copyWith(void Function(QueryAllEmailResponse) updates) => super.copyWith((message) => updates(message as QueryAllEmailResponse)) as QueryAllEmailResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAllEmailResponse create() => QueryAllEmailResponse._();
  QueryAllEmailResponse createEmptyInstance() => create();
  static $pb.PbList<QueryAllEmailResponse> createRepeated() => $pb.PbList<QueryAllEmailResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryAllEmailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAllEmailResponse>(create);
  static QueryAllEmailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.Email> get email => $_getList(0);

  @$pb.TagNumber(2)
  $3.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($3.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $3.PageResponse ensurePagination() => $_ensure(1);
}

