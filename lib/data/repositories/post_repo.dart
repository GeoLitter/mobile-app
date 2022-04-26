// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import '../api_client.dart';
import '../services/secure_storage_service.dart';

class PostsRepo {
  late ApiService _apiService;
  final SecureLocalStorage _secureLocalStorage = SecureLocalStorage();
  String _baseUrl = "https://polar-atoll-65466.herokuapp.com/posts";

  PostsRepo() {
    var dio = Dio();
    _apiService = ApiService(_baseUrl, dio);
  }

  Future getPosts() async {
    final response = await _apiService.get('/');
    //return data model
    return response;
  }

  Future getPostById(String id) async {
    return await _apiService.get('/$id');
  }

  Future createPost(
    String name,
    String description,
    String lat,
    String long,
    String date,
    String geoprivacy,
    String clusterId,
  ) async {
    try {
      String profileId = await _secureLocalStorage.readSecureData('profileId');
      return await _apiService.post('/', data: {
        "name": name,
        "description": description,
        "lat": lat,
        "long": long,
        "date": date,
        "geoprivacy": geoprivacy,
        "clusterId": clusterId,
        "profileId": profileId
      });
    } catch (e) {
      print("ANother Error $e");
      throw e;
    }
  }

  Future likePost(String id) async {
    await _apiService.post('/like/$id');
  }
}
