import 'dart:async';
import 'package:dio/dio.dart';
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
  bool _isAuthenticated = false;
  bool _isLoginLoading = false;
  // bool _isSignUpLoading = false;

  //getters
  bool get isLoginLoading => _isLoginLoading;
  bool get isAuthenticated => _isAuthenticated;
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
    print("This is email: $_email");
  }

  setPassword() {
    _password = passwordController.text;
    print("This is password: $_password");
  }

  Future loginUser() async {
    setLoginLoading = true;
    try {
      print("Making request with $email and $password");
      var response = await _authRepo.loginUser(email, password);
      print(response);
      await updateAuthStatus();
    } catch (e) {
      print("Error from ViewModel: $e");
    }
    setLoginLoading = false;
    notifyListeners();
    //make request and notify
  }

  Future<bool> updateAuthStatus() async {
    //user data exists
    if (await _secureLocalStorage.readSecureData('token') != null ||
        await _secureLocalStorage.readSecureData('refresh_token') != null) {
      _isAuthenticated = true;
      notifyListeners();
      return true;
    }
    _isAuthenticated = false;
    notifyListeners();
    return false;
  }
}
