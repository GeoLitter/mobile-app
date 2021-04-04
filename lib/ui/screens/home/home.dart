import 'package:Ecocrypt/ui/screens/home/widgets/actions_boolbar.dart';
import 'package:Ecocrypt/ui/screens/home/widgets/bottom_toolbar.dart';
import 'package:Ecocrypt/ui/screens/home/widgets/video_description.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  Widget topNav() => Container(
        margin: EdgeInsets.only(top: 35),
        child: Row(
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
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                alignment: Alignment.topCenter,
                icon: Icon(Icons.settings, color: Colors.black54),
                onPressed: () {},
              ),
            )
          ],
        ),
      );

  Widget topSection(_tabController, context) => Container(
      height: 50.0,
      width: 300,
      alignment: Alignment(0.0, 0.0),
      child: TabBar(
        controller: _tabController,
        // give the indicator a decoration (color and border radius)
        indicator: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 2.0, color: Colors.lightGreenAccent)),
        ),
        labelColor: Colors.lightGreenAccent,
        unselectedLabelColor: Colors.black54,
        tabs: [
          // first tab [you can add an icon using the icon property]
          Tab(
            text: 'Reports',
          ),

          // second tab [you can add an icon using the icon property]
          Tab(
            text: 'Issues',
          ),
          Tab(
            text: 'Near you',
          ),
        ],
      ));

  Widget middleSection(_tabController, context) => Expanded(
        child: Container(
          child: TabBarView(
            controller: _tabController,
            children: [
              Stack(children: <Widget>[VideoDescription(), ActionsToolbar()]),
              Stack(children: <Widget>[VideoDescription(), ActionsToolbar()]),
              Stack(children: <Widget>[VideoDescription(), ActionsToolbar()])
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //Top Nav
          topNav(),
          // Top section
          topSection(_tabController, context),

          // Middle expanded
          middleSection(_tabController, context),

          // Bottom Section
          BottomToolbar(),
        ],
      ),
    );
  }
}
