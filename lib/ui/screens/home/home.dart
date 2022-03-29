import 'package:mobile/ui/screens/home/widgets/actions_boolbar.dart';
import 'package:mobile/ui/screens/home/widgets/bottom_toolbar.dart';
import 'package:mobile/ui/screens/home/widgets/map_view.dart';
import 'package:mobile/ui/screens/home/widgets/post_view.dart';
import 'package:flutter/material.dart';
import 'package:mobile/view-models/HomeViewModel.dart';
import 'package:mobile/view-models/PostViewModel.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

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
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);
    postViewModel.getPostData(context);
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
                icon: Icon(Icons.search_outlined, color: Colors.black54),
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
          border: Border(bottom: BorderSide(width: 2.0, color: Colors.blue)),
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

  Widget middleSection(_tabController, context) => Expanded(
        child: Provider.of<PostViewModel>(context, listen: true).isLoading
            ? Container(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Provider.of<HomeViewModel>(context, listen: true).isMap
                        ? ListView.builder(
                            itemCount: Provider.of<PostViewModel>(context,
                                    listen: true)
                                .posts
                                ?.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            // Stack(children: <Widget>[PostView(), ActionsToolbar()])
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
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
            : Text("Loading..."),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
