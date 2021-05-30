///
//  Generated code. Do not modify.
//  source: cosmos/address/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tx.pb.dart' as $0;
export 'tx.pb.dart';

class MsgClient extends $grpc.Client {
  static final _$createAddress =
      $grpc.ClientMethod<$0.MsgCreateAddress, $0.MsgCreateAddressResponse>(
          '/schrsi.demail.address.Msg/CreateAddress',
          ($0.MsgCreateAddress value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgCreateAddressResponse.fromBuffer(value));
  static final _$updateAddress =
      $grpc.ClientMethod<$0.MsgUpdateAddress, $0.MsgUpdateAddressResponse>(
          '/schrsi.demail.address.Msg/UpdateAddress',
          ($0.MsgUpdateAddress value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgUpdateAddressResponse.fromBuffer(value));

  MsgClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.MsgCreateAddressResponse> createAddress(
      $0.MsgCreateAddress request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAddress, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgUpdateAddressResponse> updateAddress(
      $0.MsgUpdateAddress request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateAddress, request, options: options);
  }
}

abstract class MsgServiceBase extends $grpc.Service {
  $core.String get $name => 'schrsi.demail.address.Msg';

  MsgServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.MsgCreateAddress, $0.MsgCreateAddressResponse>(
            'CreateAddress',
            createAddress_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.MsgCreateAddress.fromBuffer(value),
            ($0.MsgCreateAddressResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.MsgUpdateAddress, $0.MsgUpdateAddressResponse>(
            'UpdateAddress',
            updateAddress_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.MsgUpdateAddress.fromBuffer(value),
            ($0.MsgUpdateAddressResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.MsgCreateAddressResponse> createAddress_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MsgCreateAddress> request) async {
    return createAddress(call, await request);
  }

  $async.Future<$0.MsgUpdateAddressResponse> updateAddress_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MsgUpdateAddress> request) async {
    return updateAddress(call, await request);
  }

  $async.Future<$0.MsgCreateAddressResponse> createAddress(
      $grpc.ServiceCall call, $0.MsgCreateAddress request);
  $async.Future<$0.MsgUpdateAddressResponse> updateAddress(
      $grpc.ServiceCall call, $0.MsgUpdateAddress request);
}
