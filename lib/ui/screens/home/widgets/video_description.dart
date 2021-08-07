import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Column(children: <Widget>[
            Expanded(
                child: Image.network(
                    'https://i.pinimg.com/originals/25/f3/dd/25f3ddf2d081713e9931147355db3195.jpg')),
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
          ])),
    );
  }
}
