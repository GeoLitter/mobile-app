import 'package:flutter/material.dart';

import '../../profiles/user_profile.dart';

class TopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                alignment: Alignment.topCenter,
                icon: Icon(Icons.search_outlined, color: Colors.black54),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                alignment: Alignment.topCenter,
                icon: Icon(Icons.settings, color: Colors.black54),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserProfile()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
