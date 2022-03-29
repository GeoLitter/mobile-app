// ignore: import_of_legacy_library_into_null_safe
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isMap = false;

  get isMap => _isMap;

  toggleMap() {
    _isMap = !isMap;
    notifyListeners();
  }
}
