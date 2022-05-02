import 'package:mobile/ui/screens/home/widgets/actions_boolbar.dart';
import 'package:mobile/ui/screens/home/widgets/bottom_toolbar.dart';
import 'package:mobile/ui/screens/home/widgets/map_view.dart';
import 'package:mobile/ui/screens/home/widgets/post_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile/ui/screens/home/widgets/top_navbar.dart';
import 'package:mobile/view-models/HomeViewModel.dart';
import 'package:mobile/view-models/PostsViewModel.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

import '../profiles/user_profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    final postViewModel = Provider.of<PostsViewModel>(context, listen: false);
    postViewModel.getPostData(context);
  }

  Widget topSection(_tabController, context) => Container(
      height: 50.0,
      child: TabBar(
        controller: _tabController,
        // give the indicator a decoration (color and border radius)
        indicator: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.5, color: Colors.blue)),
        ),
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.black54,
        tabs: [
          // first tab [you can add an icon using the icon property]
          Tab(
            text: 'Trending',
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

  Widget middleSection(_tabController, context) => Provider.of<PostsViewModel>(
              context,
              listen: true)
          .isLoading
      ? Container(
          margin: EdgeInsets.only(
              top: Provider.of<HomeViewModel>(context, listen: true).isMap
                  ? 160
                  : 0),
          child: TabBarView(
            physics: !Provider.of<HomeViewModel>(context, listen: true).isMap
                ? NeverScrollableScrollPhysics()
                : null,
            controller: _tabController,
            children: [
              Provider.of<HomeViewModel>(context, listen: true).isMap
                  ? ListView.builder(
                      itemCount:
                          Provider.of<PostsViewModel>(context, listen: true)
                              .posts
                              ?.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      // Stack(children: <Widget>[PostView(), ActionsToolbar()])
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: MediaQuery.of(context).size.height * .75,
                            child: Stack(children: <Widget>[
                              PostView(index),
                              ActionsToolbar(index)
                            ]));
                      })
                  : MapView(),
              Provider.of<HomeViewModel>(context, listen: true).isMap
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Text("Hello"))
                  : MapView(),
              Provider.of<HomeViewModel>(context, listen: true).isMap
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Text("Hello"))
                  : MapView(),
            ],
          ),
        )
      : Align(alignment: Alignment.center, child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //must be place onTop so other widget can overlap the map and post
          // Middle expanded
          middleSection(_tabController, context),
          //Top Nav
          Positioned(top: 0, child: TopNavBar()),
          // Top section
          Positioned(
              width: MediaQuery.of(context).size.width,
              top: 100,
              child: topSection(_tabController, context)),

          // Bottom Section
          Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 0,
              child: BottomToolbar()),
        ],
      ),
    );
  }
}
