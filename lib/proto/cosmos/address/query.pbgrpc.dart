///
//  Generated code. Do not modify.
//  source: cosmos/address/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $1;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$addressByName = $grpc.ClientMethod<
          $1.QueryGetAddressByNameRequest, $1.QueryGetAddressResponse>(
      '/schrsi.demail.address.Query/AddressByName',
      ($1.QueryGetAddressByNameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryGetAddressResponse.fromBuffer(value));
  static final _$addressByVersion = $grpc.ClientMethod<
          $1.QueryGetAddressByVersionRequest, $1.QueryGetAddressResponse>(
      '/schrsi.demail.address.Query/AddressByVersion',
      ($1.QueryGetAddressByVersionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.QueryGetAddressResponse.fromBuffer(value));
  static final _$addressAll =
      $grpc.ClientMethod<$1.QueryAllAddressRequest, $1.QueryAllAddressResponse>(
          '/schrsi.demail.address.Query/AddressAll',
          ($1.QueryAllAddressRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.QueryAllAddressResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.QueryGetAddressResponse> addressByName(
      $1.QueryGetAddressByNameRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addressByName, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryGetAddressResponse> addressByVersion(
      $1.QueryGetAddressByVersionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addressByVersion, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryAllAddressResponse> addressAll(
      $1.QueryAllAddressRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addressAll, request, options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'schrsi.demail.address.Query';

  QueryServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.QueryGetAddressByNameRequest,
            $1.QueryGetAddressResponse>(
        'AddressByName',
        addressByName_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryGetAddressByNameRequest.fromBuffer(value),
        ($1.QueryGetAddressResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryGetAddressByVersionRequest,
            $1.QueryGetAddressResponse>(
        'AddressByVersion',
        addressByVersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryGetAddressByVersionRequest.fromBuffer(value),
        ($1.QueryGetAddressResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryAllAddressRequest,
            $1.QueryAllAddressResponse>(
        'AddressAll',
        addressAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.QueryAllAddressRequest.fromBuffer(value),
        ($1.QueryAllAddressResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.QueryGetAddressResponse> addressByName_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryGetAddressByNameRequest> request) async {
    return addressByName(call, await request);
  }

  $async.Future<$1.QueryGetAddressResponse> addressByVersion_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryGetAddressByVersionRequest> request) async {
    return addressByVersion(call, await request);
  }

  $async.Future<$1.QueryAllAddressResponse> addressAll_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.QueryAllAddressRequest> request) async {
    return addressAll(call, await request);
  }

  $async.Future<$1.QueryGetAddressResponse> addressByName(
      $grpc.ServiceCall call, $1.QueryGetAddressByNameRequest request);
  $async.Future<$1.QueryGetAddressResponse> addressByVersion(
      $grpc.ServiceCall call, $1.QueryGetAddressByVersionRequest request);
  $async.Future<$1.QueryAllAddressResponse> addressAll(
      $grpc.ServiceCall call, $1.QueryAllAddressRequest request);
}
