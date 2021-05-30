///
//  Generated code. Do not modify.
//  source: cosmos/email/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $1;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$emailById =
      $grpc.ClientMethod<$1.QueryGetEmailByIdRequest, $1.QueryGetEmailResponse>(
          '/schrsi.demail.email.Query/EmailById',
          ($1.QueryGetEmailByIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.QueryGetEmailResponse.fromBuffer(value));
  static final _$emailAll =
      $grpc.ClientMethod<$1.QueryAllEmailRequest, $1.QueryAllEmailResponse>(
          '/schrsi.demail.email.Query/EmailAll',
          ($1.QueryAllEmailRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.QueryAllEmailResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.QueryGetEmailResponse> emailById(
      $1.QueryGetEmailByIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$emailById, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryAllEmailResponse> emailAll(
      $1.QueryAllEmailRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$emailAll, request, options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'schrsi.demail.email.Query';

  QueryServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.QueryGetEmailByIdRequest,
            $1.QueryGetEmailResponse>(
        'EmailById',
        emailById_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryGetEmailByIdRequest.fromBuffer(value),
        ($1.QueryGetEmailResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.QueryAllEmailRequest, $1.QueryAllEmailResponse>(
            'EmailAll',
            emailAll_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.QueryAllEmailRequest.fromBuffer(value),
            ($1.QueryAllEmailResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.QueryGetEmailResponse> emailById_Pre($grpc.ServiceCall call,
      $async.Future<$1.QueryGetEmailByIdRequest> request) async {
    return emailById(call, await request);
  }

  $async.Future<$1.QueryAllEmailResponse> emailAll_Pre($grpc.ServiceCall call,
      $async.Future<$1.QueryAllEmailRequest> request) async {
    return emailAll(call, await request);
  }

  $async.Future<$1.QueryGetEmailResponse> emailById(
      $grpc.ServiceCall call, $1.QueryGetEmailByIdRequest request);
  $async.Future<$1.QueryAllEmailResponse> emailAll(
      $grpc.ServiceCall call, $1.QueryAllEmailRequest request);
}
