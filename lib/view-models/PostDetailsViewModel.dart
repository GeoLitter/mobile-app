// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/repositories/post_repo.dart';

import '../data/repositories/profile_repo.dart';
import '../utils/alert_info_modal.dart';

class PostDetailsViewModel extends ChangeNotifier {
  final PostsRepo _postsRepo = PostsRepo();
  bool _isLoading = true;
  Map<String, dynamic>? _postDetails;

  //getters
  get postDetails => _postDetails;
  get isLoading => _isLoading;

  //setters
  void setPostDetails(Map<String, dynamic> postDetails) {
    _postDetails = postDetails;
  }

  set setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future getProfileData(context, id) async {
    try {
      Response response = await _postsRepo.getPostById(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        setPostDetails(response.data['data']);
        setLoading = false;
      }
    } on DioError catch (error) {
      displayAlertModal(context, error.response?.data['message']);
    }
  }
}
