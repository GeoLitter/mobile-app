import 'dart:async';
import 'package:ecocrypt/data/repositories/auth_repo.dart';
import 'package:ecocrypt/data/services/secure_storage_service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final SecureLocalStorage _secureLocalStorage = SecureLocalStorage();
  final AuthRepo _authRepo = AuthRepo();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  var _userName;
  var _email;
  var _password;
  bool isAuthenticated = false;
  bool _isLoginLoading = false;
  // bool _isSignUpLoading = false;

  //getters
  bool get isLoginLoading => _isLoginLoading;
  String get username => _userName;
  String get email => _email;
  String get password => _password;

  //setters
  set setLoginLoading(bool isLoginLoading) {
    _isLoginLoading = isLoginLoading;
    notifyListeners();
  }

  setEmail() {
    _email = emailController.text;
  }

  setPassword() {
    _password = passwordController.text;
  }

  setLoginDetails(String username, String password) async {
    _userName = username;
    _password = password;
    //make request and notify
  }

  Future loginUser() async {
    setLoginLoading = true;
    var response = await _authRepo.apiTest();
    print(response);
    setLoginLoading = false;
    notifyListeners();
    //make request and notify
  }

  Future<bool> updateAuthStatus() async {
    //user data exists
    if (await _secureLocalStorage.readSecureData('userId') != null ||
        await _secureLocalStorage.readSecureData('refresh_token') != null) {
      isAuthenticated = true;
      notifyListeners();
      return true;
    }
    isAuthenticated = false;
    notifyListeners();
    return false;
  }
}
