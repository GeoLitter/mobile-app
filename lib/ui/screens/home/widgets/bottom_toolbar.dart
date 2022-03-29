import 'package:mobile/ui/screens/profiles/user_profile.dart';
import 'package:mobile/ui/screens/search/search.dart';
import 'package:flutter/material.dart';

class BottomToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: (() => {}),
            child: Icon(
              Icons.map,
              color: Colors.white,
            ),
          ),
          ElevatedButton(
              onPressed: (() => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()))),
              child: Icon(Icons.camera_enhance_rounded, color: Colors.white)),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
              child: Icon(Icons.people, color: Colors.white))
        ],
      ),
    );
  }
}
