import 'package:mobile/ui/constants/button_styles.dart';
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
                      style: flatButtonStyle,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Yes, I confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "No, next time",
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
