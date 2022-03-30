// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:mobile/data/api_client.dart';
import 'package:mobile/data/services/secure_storage_service.dart';

class AuthRepo {
  late ApiService _apiService;
  final SecureLocalStorage _secureLocalStorage = SecureLocalStorage();
  String _baseUrl = "https://polar-atoll-65466.herokuapp.com";

  AuthRepo() {
    var dio = Dio();
    _apiService = ApiService(_baseUrl, dio);
  }

  Future apiTest() async {
    try {
      final response = await _apiService.get('/');
      //return data model
      return response;
    } catch (e) {
      //return network exceptions and errors
      print("error: $e");
      throw e;
    }
  }

  Future loginUser(String email, String password) async {
    return await _apiService.post('/login', data: {
      "email": email,
      "password": password,
      // "fcmToken": await _secureLocalStorage.readSecureData("fcmToken")
    });
  }

  Future registerUser(String username, String email, String password) async {
    return await _apiService.post('/signup',
        data: {"name": username, "email": email, "password": password});
  }

  Future logoutUser() async {
    //delete tokens - this should logout user
    //because of provider viewmodel
    await _secureLocalStorage.deleteSecureData('token');
    await _secureLocalStorage.deleteSecureData('refresh_token');
  }
}
