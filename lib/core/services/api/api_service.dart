import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "http://10.0.2.2:5000/api/v1";
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.baseUrl = _baseUrl;

    _dio.options.connectTimeout = const Duration(seconds: 20);
    _dio.options.receiveTimeout = const Duration(seconds: 20);

    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  /// GET
  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await _dio.get(endpoint, queryParameters: query);
    } catch (e) {
      rethrow;
    }
  }

  /// POST
  Future<Response> post({
    required String endpoint,
    dynamic data,
  }) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      rethrow;
    }
  }

  /// PUT
  Future<Response> put({
    required String endpoint,
    dynamic data,
  }) async {
    try {
      return await _dio.put(endpoint, data: data);
    } catch (e) {
      rethrow;
    }
  }

  /// DELETE
  Future<Response> delete({
    required String endpoint,
  }) async {
    try {
      return await _dio.delete(endpoint);
    } catch (e) {
      rethrow;
    }
  }
}