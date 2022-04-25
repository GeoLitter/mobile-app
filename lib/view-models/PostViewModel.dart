import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/repositories/post_repo.dart';

import '../utils/alert_info_modal.dart';

class PostViewModel extends ChangeNotifier {
  final PostsRepo _postsRepo = PostsRepo();
  File? _image;
  TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  bool _isUploading = false;

  get image => _image;
  get selectedDate => _selectedDate;
  get dateController => _dateController;
  get isUploading => _isUploading;

  setImage(File image) {
    print("Image: $image");
    _image = image;
    notifyListeners();
  }

  clearImage() {
    _image = null;
    notifyListeners();
    print("Hello World");
  }

  setDate(DateTime? picked) {
    _selectedDate = picked!;
    _dateController.text = "${picked}";
  }

  set setIsUploading(bool uploading) {
    _isUploading = uploading;
    notifyListeners();
  }

  Future createPost(context) async {
    setIsUploading = true;
    try {
      print("About to create post");
      final Response response = await _postsRepo.createPost();
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        setIsUploading = false;
      }
    } on DioError catch (error) {
      displayAlertModal(context, error.response?.data['message']);
      setIsUploading = false;
      throw error;
    }
  }
}
