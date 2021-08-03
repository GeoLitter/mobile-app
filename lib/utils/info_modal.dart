import 'package:ecocrypt/ui/constants/button_styles.dart';
import 'package:flutter/material.dart';

void displayInfoModal(BuildContext context, infoMessage) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)), //this right here
          child: Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "$infoMessage",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      style: flatButtonModalStyle,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
