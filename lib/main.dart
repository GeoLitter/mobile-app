import 'package:Ecocrypt/griddashboard.dart';
import 'package:Ecocrypt/ui/constants/theme_colors.dart';
import 'package:Ecocrypt/ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoCrypt',
      color: lightBackground,
      theme: ThemeData(
        primarySwatch: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   title: Center(child: Text(widget.title)),
      // ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                  alignment: Alignment.topCenter,
                  icon: Icon(Icons.camera_alt_outlined, color: Colors.black54),
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
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Explore and protect earth!",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Share what you see!",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: lightBackground,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Icon(
                    Icons.notification_important_outlined,
                    color: lightBackground,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
