import 'package:flutter/material.dart';

void displayCommentsBottomSheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              )),
          height: MediaQuery.of(context).size.height * 0.25,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 23, right: 23, bottom: 30, top: 20),
            child: Text("Hello World"),
          ),
        );
      });
}
