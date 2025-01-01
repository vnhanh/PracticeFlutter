import 'dart:io';

import 'package:demo_crypto_checker/core/configuration/app_config.dart';
import 'package:demo_crypto_checker/core/network/network_exception.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

enum DioMethod { post, get, put, delete }

/// Reference: https://medium.com/@engrshahzaibabid/api-integration-in-flutter-using-dio-dependency-step-by-step-tutorial-23038c5d42f8
@lazySingleton
class ApiService {
  final Dio _dio;
  final AppConfig _appConfig;

  const ApiService(this._dio, this._appConfig);

  Dio get dio => _dio;
  // set dio(Dio newDio) => _dio = newDio;

  Future<dynamic> request(
      String endPoint,
      DioMethod method,
      {
        Map<String, dynamic>? param,
        String? contentType,
        formData,
      }
  ) async {
    final dioRequest = Dio(
      BaseOptions(
        baseUrl: _appConfig.baseUrl,
        contentType: contentType ?? Headers.formUrlEncodedContentType,
        headers: {
          /// TODO: will set 'Bearer $token’ later
          HttpHeaders.authorizationHeader: 'Bearer '
        }
      )
    );

    try {
      Response<Map<String, dynamic>> response =
        await callApi(endPoint, method, dioRequest, param: param);

      switch (response.statusCode) {
        case 200: return parseResponse(response.data);
        case 401: throw LogoutException();
        default: throw ApiException(
            statusCode: response.statusCode ?? 400,
            apiCode: response.data?['status'] as int? ?? failedApiCode,
            message: response.data?['message'] as String? ?? ""
        );
      }
    } catch (e) {
      // if (e is )
      switch (e) {
        case LogoutException():
        case ApiException(): rethrow;
        default: throw ApiException(statusCode: failedApiCode, apiCode: -1, message: e.toString());
      }
    }
  }

  Future<dynamic> callApi(
      String endPoint,
      DioMethod method,
      Dio dioRequest,
      {
        Map<String, dynamic>? param,
      }
  ) async {
    switch (method) {
      case DioMethod.get: return dioRequest.get(endPoint, data: param);
      case DioMethod.post: return dioRequest.post(endPoint, data: param);
      case DioMethod.put: return dioRequest.put(endPoint, data: param);
      case DioMethod.delete: return dioRequest.delete(endPoint, data: param);
    }
  }

  /// {
  //   "status": "success",
  //   "data": {
  //     "user": {
  //       "id": 123,
  //       "name": "John Doe",
  //       "email": "john.doe@example.com"
  //     }
  //   }
  // }
  dynamic parseResponse(Map<String, dynamic>? response) {
    if (response == null) return {};
    final apiStatus = response['status'] as int? ?? failedApiCode;
    final errorMessage = response['message'] ?? "";

    switch (apiStatus) {
      case successApiCode: return response['data'] ?? {};
      default: throw ApiException(statusCode: 200, apiCode: apiStatus, message: errorMessage);
    }
  }
}
