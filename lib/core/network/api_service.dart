import 'dart:convert';
import 'package:demo_crypto_checker/core/network/network_exception.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Dio get dio => _dio;
  // set dio(Dio newDio) => _dio = newDio;

  Future<Map<String, dynamic>> fetchData(String url) async {
    try {
      final response = await _dio.get(url);
      switch (response.statusCode) {
        case 200: return parseResponse(response.data);
        case 401: throw LogoutException();
        default: throw ApiException(statusCode: response.statusCode ?? 400, apiCode: response.data['status'], message: response.data['message']);
      }
    } catch (e) {
      throw FetchException(message: e.toString());
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
  Map<String, dynamic> parseResponse(Map<String, dynamic>? response) {
    if (response == null) return {};
    final apiStatus = response['status'] as int? ?? failedApiCode;
    final errorMessage = response['message'] ?? "";

    switch (apiStatus) {
      case successApiCode: return response['data'] ?? {};
      default: throw ApiException(statusCode: 200, apiCode: apiStatus, message: errorMessage);
    }
  }
}
