import 'package:ecocrypt/providers/AuthViewModel.dart';
import 'package:ecocrypt/ui/screens/auth/welcome.dart';
import 'package:ecocrypt/ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider.of<AuthViewModel>(context).isAuthenticated
        ? Home()
        : WelcomePage();
  }
}
