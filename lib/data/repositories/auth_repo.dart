import 'package:dio/dio.dart';
import 'package:ecocrypt/data/api_client.dart';

class AuthRepo {
  ApiService _apiService;
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
}
