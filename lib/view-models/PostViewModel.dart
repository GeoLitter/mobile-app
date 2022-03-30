// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/repositories/post_repo.dart';

import '../utils/alert_info_modal.dart';

class PostViewModel extends ChangeNotifier {
  List? _posts;
  final PostsRepo _postsRepo = PostsRepo();
  bool _isLoading = false;

  get isLoading => _isLoading;
  get posts => _posts;

  set setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future getPostData(context) async {
    try {
      Response response = await _postsRepo.getPosts();
      if (response.statusCode == 401)
        displayAlertModal(context, "Not Authenticated");
      if (response.statusCode == 200 || response.statusCode == 201) {
        _posts = response.data['data'];
        setLoading = true;
      }
    } on DioError catch (error) {
      displayAlertModal(context, error.response?.data['message']);
    }
  }
}
