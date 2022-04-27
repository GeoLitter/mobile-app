import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import '../../view-models/PostViewModel.dart';

void displayLoadingModal(BuildContext context, infoMessage) {
  final postViewModel = Provider.of<PostViewModel>(context, listen: false);
  showDialog(
      context: context,
      barrierDismissible: false,
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
                  postViewModel.buildProgress()
                ],
              ),
            ),
          ),
        );
      });
}
