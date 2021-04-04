import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              Expanded(
                  child: Image.network('https://picsum.photos/250?image=9')),
              Container(
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '@firstjonny',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'Video title and some other stuff',
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(children: [
                      Icon(
                        Icons.music_note,
                        size: 15.0,
                        color: Colors.white,
                      ),
                      Text('Artist name - Album name - song',
                          style: TextStyle(fontSize: 12.0, color: Colors.white))
                    ]),
                  ],
                ),
              )
            ])));
  }
}
