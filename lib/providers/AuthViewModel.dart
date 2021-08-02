import 'package:ecocrypt/data/services/secure_storage_service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final SecureLocalStorage _secureLocalStorage = SecureLocalStorage();
  var _userName;
  var _email;
  var _password;
  bool isAuthenticated = false;
  bool isLoginLoading;
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

  setLoginDetails(String username, String password) async {
    _userName = username;
    _password = password;
    //make request and notify
  }

  setSignUpDetails(String username, String email, String password) async {
    _userName = username;
    _password = password;
    //make request and notify
  }

  Future<void> updateAuthStatus() async {
    //user data exists
    if (await _secureLocalStorage.readSecureData('userId') != null ||
        await _secureLocalStorage.readSecureData('refresh_token') != null) {
      isAuthenticated = true;
      notifyListeners();
    }
    isAuthenticated = false;
    notifyListeners();
  }
}
