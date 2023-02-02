import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  static final ApiClient _singleton = ApiClient._internal();

  late Dio _dio;

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._internal() {
    _dio = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
        },
        receiveTimeout: 360000,
        connectTimeout: 12000,
        baseUrl: 'https://fakestoreapi.com',
      ),
    );

    // if build mode is not kReleaseMode then log all the details network request
    if (!kReleaseMode) {
      _dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        error: true,
        responseHeader: true,
        request: true,
        requestBody: true,
        responseBody: true,
      ));
    }
  }

  Future<T> get<T>(
    String pathOrUrl, {
    required Map<String, String> headers,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) parser,
    dynamic ref,
  }) async {
    Response response;
    try {
      response = await _dio.get(
        pathOrUrl,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return parser.call(response.data) ?? response.data;
    } on DioError catch (err) {
      rethrow;
    } catch (error) {
      debugPrint(' final error $error');
      rethrow;
    }
  }

  Future<T> post<T>(
    String pathOrUrl, {
    required Map<String, String> headers,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) parser,
  }) async {
    Response response;
    try {
      response = await _dio.post(
        pathOrUrl,
        options: Options(
          headers: headers,
        ),
        data: data,
        queryParameters: queryParameters,
      );
      return parser.call(response.data) ?? response.data;
    } on DioError catch (err) {
      rethrow;
    } catch (error) {
      debugPrint(' final error post $error');
      rethrow;
    }
  }
}
