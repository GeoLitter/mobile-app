import 'package:ecocrypt/providers/AuthViewModel.dart';
import 'package:ecocrypt/ui/screens/auth/sign_in.dart';
import 'package:ecocrypt/ui/screens/auth/welcome.dart';
import 'package:ecocrypt/ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: true);
    authViewModel.updateAuthStatus();
    //todo: fix bug where screen is not being re-rendered
    return authViewModel.isAuthenticated ? Home() : WelcomePage();
  }
}
