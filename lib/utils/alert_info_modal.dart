import 'package:mobile/ui/constants/button_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void displayAlertModal(BuildContext context, infoMessage) {
  // set up the button
  Widget okButton = TextButton(
    style: flatButtonModalStyle,
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog androidAlert = AlertDialog(
    title: Text(
      "Notice",
      style: TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
    ),
    content: Text(
      "$infoMessage",
      textAlign: TextAlign.center,
    ),
    actions: [
      okButton,
    ],
  );

  CupertinoAlertDialog iOSAlert = CupertinoAlertDialog(
    title: Text(
      "Notice",
      style: TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
    ),
    content: Text(
      "$infoMessage",
      textAlign: TextAlign.center,
    ),
    actions: [okButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme.of(context).platform == TargetPlatform.iOS
          ? iOSAlert
          : androidAlert;
    },
  );
}
