import 'package:Ecocrypt/ui/screens/home/widgets/actions_boolbar.dart';
import 'package:Ecocrypt/ui/screens/home/widgets/bottom_toolbar.dart';
import 'package:Ecocrypt/ui/screens/home/widgets/video_description.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget get topNav => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              alignment: Alignment.topCenter,
              icon: Icon(Icons.map, color: Colors.black54),
              onPressed: () {},
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image(
                  image: AssetImage("assets/logo_transparent.png"),
                  width: 90,
                  height: 90,
                  fit: BoxFit.scaleDown,
                  alignment: FractionalOffset.center)),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              alignment: Alignment.topCenter,
              icon: Icon(Icons.settings, color: Colors.black54),
              onPressed: () {},
            ),
          )
        ],
      );

  Widget get topSection => Container(
        height: 80.0,
        padding: EdgeInsets.only(bottom: 15.0),
        alignment: Alignment(0.0, 1.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Following',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: 15.0,
              ),
              Text('For you',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))
            ]),
      );

  Widget get middleSection => Expanded(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[VideoDescription(), ActionsToolbar()]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Top Nav
          topNav,
          // Top section
          topSection,

          // Middle expanded
          middleSection,

          // Bottom Section
          BottomToolbar(),
        ],
      ),
    );
  }
}
