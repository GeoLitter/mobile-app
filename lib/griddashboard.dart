import 'package:ecocrypt/ui/constants/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Explore",
      subtitle: "Observations",
      event: "3 Events",
      img: "assets/logo_transparent.png");

  Items item2 = new Items(
    title: "Community",
    subtitle: "Meet other people",
    event: "4 Items",
    img: "assets/logo_transparent.png",
  );
  Items item3 = new Items(
    title: "Statistics",
    subtitle: "Our Achievements",
    event: "",
    img: "assets/logo_transparent.png",
  );
  Items item4 = new Items(
    title: "News",
    subtitle: "Learn about earth",
    event: "",
    img: "assets/logo_transparent.png",
  );
  Items item5 = new Items(
    title: "Settings",
    subtitle: "Customize your profile",
    event: "4 Items",
    img: "assets/logo_transparent.png",
  );
  Items item6 = new Items(
    title: "Donate",
    subtitle: "Non-profit!",
    event: "2 Items",
    img: "assets/logo_transparent.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: lightBackground,
                  borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                onPressed: () {
                  print("Hello");
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: secondaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.subtitle,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: lightText,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.event,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}
