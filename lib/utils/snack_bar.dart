import 'package:flutter/material.dart';

displaySnackBar(BuildContext context, message) {
  return SnackBar(
      content: Text('$message'),
      action: SnackBarAction(
        label: 'ok',
        onPressed: () {
          // Some code to undo the change.
          print('SNack bar clicked');
        },
      ));
}
