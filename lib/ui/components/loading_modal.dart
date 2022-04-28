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
                  Consumer<PostViewModel>(
                    builder: (context, value, child) => Visibility(
                        visible: value.isUploading,
                        child: postViewModel.buildProgress()),
                  ),
                  Consumer<PostViewModel>(
                    builder: (context, value, child) => Visibility(
                      visible: value.isPosting,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Posting"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Consumer<PostViewModel>(
                    builder: (context, value, child) => Visibility(
                      visible: value.hasUploaded,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Success!",
                              style: TextStyle(color: Colors.green),
                            ),
                          )
                        ],
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
