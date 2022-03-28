import 'package:mobile/ui/screens/auth/welcome.dart';
import 'package:mobile/ui/screens/home/home.dart';
import 'package:mobile/view-models/AuthViewModel.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: true);
    print("Is Authenticated: ${authViewModel.isAuthenticated}");
    //ensures that auth state is only updated once
    //to avoid infinite loop updating auth state
    if (!authViewModel.isAuthenticated) {
      authViewModel.updateAuthStatus();
    }
    return authViewModel.isAuthenticated
        ? Home()
        : WelcomePage(
            title: '',
          );
  }
}
