import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "http://10.0.2.2:5000";
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

 Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    final response = await _dio.get(
      endpoint,
      queryParameters: query,
    );
    return response.data;
  }

}