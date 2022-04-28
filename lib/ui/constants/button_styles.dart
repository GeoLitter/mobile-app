import 'package:flutter/material.dart';

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  backgroundColor: Colors.blue,
  primary: Colors.white,
  // minimumSize: Size(300, 50),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(19)),
  ),
);

final ButtonStyle disabledFlatButtonStyle = TextButton.styleFrom(
  backgroundColor: Colors.grey,
  primary: Colors.black,
  // minimumSize: Size(300, 50),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(19)),
  ),
);

final ButtonStyle flatButtonStyleNoRadius = TextButton.styleFrom(
    backgroundColor: Colors.blue,
    primary: Colors.white,
    // minimumSize: Size(300, 50),
    padding: EdgeInsets.all(0));

final ButtonStyle flatButtonModalStyle = TextButton.styleFrom(
    backgroundColor: Colors.transparent,
    primary: Colors.blue,
    minimumSize: Size(60, 50),
    padding: EdgeInsets.all(0));

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.indigo,
  minimumSize: Size(300, 50),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(19)),
  ),
);

final ButtonStyle homeScreenBtnStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.white,
  minimumSize: Size(68, 58),
  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
);
