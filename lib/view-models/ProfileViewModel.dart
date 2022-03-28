import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../data/repositories/profile_repo.dart';
import '../utils/alert_info_modal.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileRepo _profileRepo = ProfileRepo();
  bool _isLoading = true;
  Map<String, dynamic>? _profileInfo;

  //getters
  get profileInfo => _profileInfo;
  get isLoading => _isLoading;

  //setters
  void setProfileInfo(Map<String, dynamic> profileInfo) {
    _profileInfo = profileInfo;
  }

  set setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future getProfileData(context) async {
    try {
      Response response = await _profileRepo.getCurrentProfile();
      if (response.statusCode == 200 || response.statusCode == 201) {
        setProfileInfo(response.data['data']);
        setLoading = false;
      }
    } on DioError catch (error) {
      displayAlertModal(context, error.response.data['message']);
    }
  }
}
