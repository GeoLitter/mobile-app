import 'package:mobile/ui/constants/button_styles.dart';
import 'package:mobile/ui/screens/auth/welcome.dart';
import 'package:mobile/view-models/AuthViewModel.dart';
import 'package:flutter/material.dart';
import 'package:mobile/view-models/ProfileViewModel.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final postViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    postViewModel.getProfileData(context);
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final profileViewModel = Provider.of<ProfileViewModel>(context);

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
              backgroundImage: NetworkImage(profileViewModel
                      .profileInfo?['profileImg'] ??
                  "https://c.tenor.com/guhB4PpjrmUAAAAM/loading-loading-gif.gif"),
              radius: 80.0,
            ),
            profileViewModel.isLoading
                ? Text('loading...')
                : Text(
                    profileViewModel.profileInfo['user']?['name'] ??
                        "Luis Manzanero",
                    style: TextStyle(fontSize: 32.0),
                  ),
            Text(
              profileViewModel.profileInfo?['status'] ?? "Status",
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
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextButton(
                style: flatButtonStyle,
                onPressed: () async {
                  await authViewModel.logoutUser();
                  if (!authViewModel.isAuthenticated) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomePage(
                                  title: '',
                                )));
                  }
                  print(
                      "Is Authenticated from profile: ${authViewModel.isAuthenticated}");
                },
                child: Text("Privacey"),
              ),
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextButton(
                style: flatButtonStyle,
                onPressed: () async {
                  await profileViewModel.getProfileData(context);
                  print(
                      "Is Authenticated from profile: ${profileViewModel.isLoading}");
                },
                child: Text("Settings"),
              ),
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextButton(
                style: flatButtonStyle,
                onPressed: () async {
                  await profileViewModel.getProfileData(context);
                  print(
                      "Is Authenticated from profile: ${profileViewModel.isLoading}");
                },
                child: Text("Logout"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
