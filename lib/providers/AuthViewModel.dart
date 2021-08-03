import 'dart:async';
import 'dart:io';

import 'package:ecocrypt/data/services/secure_storage_service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final SecureLocalStorage _secureLocalStorage = SecureLocalStorage();

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  var _userName;
  var _email;
  var _password;
  bool isAuthenticated = false;
  bool isLoginLoading = false;
  bool isSignUpLoading;
  get username {
    return _userName;
  }

  get email {
    return _email;
  }

  get password {
    return _password;
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
    isLoginLoading = true;

    sleep(Duration(seconds: 1));
    print("hello");
    isLoginLoading = false;
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
