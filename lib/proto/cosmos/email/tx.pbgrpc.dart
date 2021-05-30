///
//  Generated code. Do not modify.
//  source: cosmos/email/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tx.pb.dart' as $0;
export 'tx.pb.dart';

class MsgClient extends $grpc.Client {
  static final _$createEmail =
      $grpc.ClientMethod<$0.MsgCreateEmail, $0.MsgCreateEmailResponse>(
          '/schrsi.demail.email.Msg/CreateEmail',
          ($0.MsgCreateEmail value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgCreateEmailResponse.fromBuffer(value));

  MsgClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.MsgCreateEmailResponse> createEmail(
      $0.MsgCreateEmail request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createEmail, request, options: options);
  }
}

abstract class MsgServiceBase extends $grpc.Service {
  $core.String get $name => 'schrsi.demail.email.Msg';

  MsgServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.MsgCreateEmail, $0.MsgCreateEmailResponse>(
            'CreateEmail',
            createEmail_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.MsgCreateEmail.fromBuffer(value),
            ($0.MsgCreateEmailResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.MsgCreateEmailResponse> createEmail_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MsgCreateEmail> request) async {
    return createEmail(call, await request);
  }

  $async.Future<$0.MsgCreateEmailResponse> createEmail(
      $grpc.ServiceCall call, $0.MsgCreateEmail request);
}
