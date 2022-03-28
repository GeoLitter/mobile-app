import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:mobile/data/repositories/auth_repo.dart';
import 'package:mobile/data/services/secure_storage_service.dart';
import 'package:mobile/ui/screens/auth/sign_in.dart';
import 'package:mobile/utils/alert_info_modal.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final SecureLocalStorage _secureLocalStorage = SecureLocalStorage();
  final AuthRepo _authRepo = AuthRepo();
  //todo: add form keys without it causing duplicates
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String _userName = "";
  String _email = "";
  String _password = "";
  bool _isAuthenticated = false;
  bool _isLoginLoading = false;
  bool _isRegisterLoading = false;

  //getters
  bool get isLoginLoading => _isLoginLoading;
  bool get isRegisterLoading => _isRegisterLoading;
  bool get isAuthenticated => _isAuthenticated;
  String get username => _userName;
  String get email => _email;
  String get password => _password;
  //setters
  set setLoginLoading(bool isLoginLoading) {
    _isLoginLoading = isLoginLoading;
    notifyListeners();
  }

  set setRegisterLoading(bool isRegisterLoading) {
    _isRegisterLoading = isRegisterLoading;
    notifyListeners();
  }

  set setIsAuthenticated(bool isAuthenticated) {
    _isAuthenticated = isAuthenticated;
    notifyListeners();
  }

  setUsername() {
    _userName = usernameController.text;
    print("This is username: $_userName");
  }

  setEmail() {
    _email = emailController.text;
    print("This is email: $_email");
  }

  setPassword() {
    _password = passwordController.text;
    print("This is password: $_password");
  }

  clearTextFeilds() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future apiTest(context) async {
    try {
      var response = await _authRepo.apiTest();
      print(response);
    } on DioError catch (error) {
      throw error;
    }
  }

  Future loginUser(context) async {
    setLoginLoading = true;
    try {
      final Response response = await _authRepo.loginUser(email, password);
      print(response);
      var data = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        //save access token and refresh token
        await _secureLocalStorage.writeSecureData(
            'token', data['token']['token']);
        await _secureLocalStorage.writeSecureData(
            'refresh_token', data['refreshToken']['token']);
        await _secureLocalStorage.writeSecureData(
            'profileId', data['data']['profile']['_id']);
        await updateAuthStatus();
      }
    } on DioError catch (error) {
      displayAlertModal(context, error.response.data['message']);
    }
    setLoginLoading = false;
    //make request and notify
  }

  Future registerUser(context) async {
    try {
      setRegisterLoading = true;
      final Response response =
          await _authRepo.registerUser(username, email, password);
      if (response.statusCode == 200 || response.statusCode == 201) {
        setRegisterLoading = false;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SignIn(
                      title: '',
                    )));
      }
    } on DioError catch (error) {
      displayAlertModal(context, error.response.data['message']);
      setRegisterLoading = false;
      throw error;
    }
  }

  Future<void> updateAuthStatus() async {
    //user data exists
    // ignore: unnecessary_null_comparison
    if (await _secureLocalStorage.readSecureData('token') != null ||
        // ignore: unnecessary_null_comparison
        await _secureLocalStorage.readSecureData('refresh_token') != null) {
      setIsAuthenticated = true;
    }
  }

  Future<void> logoutUser() async {
    await _authRepo.logoutUser();
    setIsAuthenticated = false;
  }
}
