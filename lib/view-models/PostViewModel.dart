import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/repositories/post_repo.dart';

import '../data/services/secure_storage_service.dart';
import '../utils/alert_info_modal.dart';

class PostViewModel extends ChangeNotifier {
  final PostsRepo _postsRepo = PostsRepo();
  final SecureLocalStorage _secureLocalStorage = SecureLocalStorage();
  File? _image;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _tagsController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String _geoPrivacy = "private";
  String _clusterId = "testid";
  String lat = "25.0330";
  String long = "121.5654";
  DateTime _selectedDate = DateTime.now();
  bool _isUploading = false;

  get name => _titleController;
  get description => _description;
  get tags => _tagsController;
  get geoPrivacy => _geoPrivacy;
  get clusterId => _clusterId;
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
      final Response response = await _postsRepo.createPost(
          name, description, lat, long, selectedDate, geoPrivacy, clusterId);
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
