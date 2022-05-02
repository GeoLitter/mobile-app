// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../api_client.dart';
import '../services/secure_storage_service.dart';

class ProfileRepo {
  late ApiService _apiService;
  final SecureLocalStorage _secureLocalStorage = SecureLocalStorage();
  String _baseUrl = "${dotenv.get('API_URL')}/profiles";

  ProfileRepo() {
    var dio = Dio();
    _apiService = ApiService(_baseUrl, dio);
  }

  Future getCurrentProfile() async {
    final profileId = await _secureLocalStorage.readSecureData('profileId');
    print("ProfileID: $profileId");
    return await _apiService.get('/$profileId');
  }
}
