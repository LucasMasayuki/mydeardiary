import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:mydeardiary/app/data/api/dio_client.dart';
import 'package:mydeardiary/app/data/api/http_error.dart';

class DioAdapter implements DioClient {
  final Dio client;

  DioAdapter(this.client);

  @override
  Future<T> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await client.get(
      url,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    return handleResponse(response);
  }

  @override
  Future<T> post<T>(
    String url, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await client.post(
      url,
      data: FormData.fromMap(data),
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return handleResponse(response);
  }

  @override
  dynamic handleResponse(Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok:
        return response.data.isEmpty ? null : response.data;
      case HttpStatus.noContent:
        return null;
      case HttpStatus.badRequest:
        throw HttpError.badRequest;
      case HttpStatus.unauthorized:
        throw HttpError.unauthorized;
      case HttpStatus.forbidden:
        throw HttpError.forbidden;
      case HttpStatus.notFound:
        throw HttpError.notFound;

      default:
        throw HttpError.serverError;
    }
  }
}
