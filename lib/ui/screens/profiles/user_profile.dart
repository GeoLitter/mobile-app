import 'package:ecocrypt/ui/constants/button_styles.dart';
import 'package:ecocrypt/ui/screens/auth/welcome.dart';
import 'package:ecocrypt/view-models/AuthViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
        leading: BackButton(
          color: Colors.black54,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://w0.pngwave.com/png/639/452/computer-icons-avatar-user-profile-people-icon-png-clip-art.png'),
              radius: 80.0,
            ),
            Text(
              'Luis Manzanero',
              style: TextStyle(fontSize: 32.0),
            ),
            Text(
              'Environmental Scientist',
              style: TextStyle(fontSize: 16.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 23,
                      child: Text(
                        '50',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Followers')
                  ],
                ),
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 23,
                      child: Text(
                        '100',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Following')
                  ],
                )
              ],
            ),
            Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.black12,
              child: TextButton(
                style: flatButtonStyle,
                onPressed: () async {
                  await authViewModel.logoutUser();
                  if (!authViewModel.isAuthenticated) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomePage()));
                  }
                  print(
                      "Is Authenticated from profile: ${authViewModel.isAuthenticated}");
                },
                child: Text("Log out"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
