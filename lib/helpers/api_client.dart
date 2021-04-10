import 'package:dio/dio.dart';

class ApiClient {
  final String baseUrl = "https://6e4da1ce961e.ngrok.io";
  Dio _dio;

  BaseOptions _dioOptionInitialization() {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 50000,
      receiveTimeout: 10000,
    );
  }

  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  ApiClient._internal() {
    _dio = Dio(_dioOptionInitialization());
  }

  Future<dynamic> getClouds() async {
    try {
      const url = "/clouds";
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      throw e;
    }
  }
}
