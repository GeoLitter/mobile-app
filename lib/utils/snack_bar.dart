import 'package:flutter/material.dart';

void displaySnackBar(BuildContext context, message) {
  Builder(builder: (BuildContext context) {
    return SnackBar(
        content: Text('$message'),
        action: SnackBarAction(
          label: 'ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ));
  });
}
