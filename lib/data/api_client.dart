// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:dio/dio.dart';

import 'services/secure_storage_service.dart';

class ApiService {
  final SecureLocalStorage _secureLocalStorage = SecureLocalStorage();
  final String baseUrl;
  late Dio _dio;

  ApiService(
    this.baseUrl,
    Dio dio,
  ) {
    _dio = dio;
    _dio
      ..options.baseUrl = baseUrl
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
    _dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      final accessToken = await _secureLocalStorage.readSecureData('token');
      var customHeaders = {'Authorization': "Bearer $accessToken"};
      print("Access Token: $accessToken");
      options.headers.addAll(customHeaders);
      // if (await NoInternetException().isConnectedToInternet() == false) {
      //   throw SocketException("No Internet");
      // }
      return handler.next(options);
    }, onError: (DioError error, ErrorInterceptorHandler handler) async {
      ("INterceoptor error: $error");
      if (error.response?.statusCode == 401) {
        final refreskToken =
            await _secureLocalStorage.readSecureData('refresh_token');
        if (refreskToken != null || refreshToken != '') {
          await refreshToken();
          return handler.resolve(await _retry(error.requestOptions));
        }
      }
      return handler.reject(error);
      // throw error;
    }));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options =
        Options(method: requestOptions.method, headers: requestOptions.headers);
    // final accessToken = await _secureLocalStorage.readSecureData('token');
    // var customHeaders = {'Authorization': "Bearer $accessToken"};
    // options.headers?.addAll(customHeaders);
    return _dio.request(requestOptions.path, options: options);
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
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

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      //add as interceoptor instead
      // if(response.statusCode == 401 && _secureLocalStorage.readSecureData('refresh_token') != null){
      //    await onRefreshToken();
      // }
      return response;
    } on SocketException catch (e) {
      print("Socket Exception: $e");
      throw e;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      //add as interceoptor instead
      // if(response.statusCode == 401 && _secureLocalStorage.readSecureData('refresh_token') != null){
      //    await onRefreshToken();
      // }
      return response;
    } on SocketException catch (e) {
      print("Socket Exception: $e");
      throw e;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<void> refreshToken() async {
    print("refresh token called");
    try {
      final refreshToken =
          await _secureLocalStorage.readSecureData('refresh_token');
      Response response = await _dio.post(
          'https://polar-atoll-65466.herokuapp.com/token',
          data: {"token": refreshToken});
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Refresh response $response");
        //save new token
        await _secureLocalStorage.writeSecureData(
            'token', response.data['token']['token']);
      } else {
        await _secureLocalStorage.writeSecureData('refresh_token', '');
        await _secureLocalStorage.writeSecureData('token', '');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
