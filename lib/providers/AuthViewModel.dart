import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  var _userName;
  var _email;
  var _password;
  bool isAuthenticated;
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
}
