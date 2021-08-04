import 'package:ecocrypt/providers/AuthViewModel.dart';
import 'package:ecocrypt/ui/screens/auth/welcome.dart';
import 'package:ecocrypt/ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key key}) : super(key: key);

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: true);
    print(authViewModel.isAuthenticated);
    //todo: fix bug where screen is not being re-rendered
    return authViewModel.isAuthenticated ? Home() : WelcomePage();
  }
}
