import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  // final SecureLocalStorage _secureLocalStorage = SecureLocalStorage();
  final String baseUrl;
  Dio _dio;

  ApiService(
    this.baseUrl,
    Dio dio,
  ) {
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw e;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      if (e is DioError) {
        // if(e.response.statusCode == 401 && _secureLocalStorage.readSecureData('refresh_token') != null) {
        //     print("request data: ${e.request.data}");
        //     await onRefreshToken();
        //     return _dio.request(e.request.path, options: e.request.data);
        // }
      }
      throw e;
    }
  }
}
