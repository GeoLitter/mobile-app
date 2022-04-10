// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/ui/screens/user/UserDetails.dart';
import 'package:mobile/view-models/PostViewModel.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class ActionsToolbar extends StatelessWidget {
  // Full dimensions of an action
  static const double ActionWidgetSize = 60.0;

// The size of the icon showen for Social Actions
  static const double ActionIconSize = 35.0;

// The size of the share social icon
  static const double ShareActionIconSize = 25.0;

// The size of the profile image in the follow Action
  static const double ProfileImageSize = 50.0;

// The size of the plus icon under the profile image in follow action
  static const double PlusIconSize = 20.0;
  final int index;

  ActionsToolbar(this.index);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 70,
      right: 0,
      child: Container(
        width: 100.0,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _getFollowAction(context),
          _getSocialAction(icon: Icons.favorite, title: '3.2m'),
          _getSocialAction(icon: Icons.chat_bubble, title: '16.4k'),
          _getSocialAction(icon: Icons.share, title: 'Share', isShare: true),
        ]),
      ),
    );
  }

  Widget _getSocialAction(
      {String? title, IconData? icon, bool isShare = false}) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        width: 60.0,
        height: 60.0,
        child: Column(children: [
          Icon(icon, size: isShare ? 25.0 : 35.0, color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
            child: Text(title!,
                style: TextStyle(
                    fontSize: isShare ? 10.0 : 12.0, color: Colors.grey)),
          )
        ]));
  }

  // ignore: unused_element
  Widget _getFollowAction(context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserDetails()));
      }),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          width: 60.0,
          height: 60.0,
          child: Stack(
              children: [_getProfilePicture(context, index), _getPlusIcon()])),
    );
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
      child: Container(
          width: PlusIconSize, // PlusIconSize = 20.0;
          height: PlusIconSize, // PlusIconSize = 20.0;
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 43, 84),
              borderRadius: BorderRadius.circular(15.0)),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20.0,
          )),
    );
  }

  Widget _getProfilePicture(context, index) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: true);
    return Positioned(
        left: (ActionWidgetSize / 2) - (ProfileImageSize / 2),
        child: CircleAvatar(
          radius: ProfileImageSize / 2,
          backgroundImage: NetworkImage(
            postViewModel.posts[index]['avatar'] ??
                "https://avatars.githubusercontent.com/u/20497361?v=4",
          ),
        ));
  }
}
