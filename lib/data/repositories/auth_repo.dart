import 'package:dio/dio.dart';
import 'package:ecocrypt/data/api_client.dart';
import 'package:ecocrypt/data/services/secure_storage_service.dart';

class AuthRepo {
  ApiService _apiService;
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
    try {
      final response = await _apiService.post('/login', data: {
        "email": email,
        "password": password,
        // "fcmToken": await _secureLocalStorage.readSecureData("fcmToken")
      });
      if (response != null) {
        //save access token and refresk token
        await _secureLocalStorage.writeSecureData(
            'token', response['token']['token']);
        await _secureLocalStorage.writeSecureData(
            'refresh_token', response['refreshToken']['token']);
        //save user id
        // await _secureLocalStorage.writeSecureData(
        //     'userId', response['data']['account']['id']);
        return response;
      }
    } catch (e) {
      print("Error from Repo: $e");
      throw e;
    }
  }

  Future logoutUser() async {
    //delete tokens - this should logout user
    //because of provider viewmodel
    await _secureLocalStorage.deleteSecureData('token');
    await _secureLocalStorage.deleteSecureData('refresh_token');
  }
}
