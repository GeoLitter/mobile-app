import 'package:mobile/ui/screens/profiles/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/bottom_sheet_modal.dart';
import 'package:mobile/view-models/HomeViewModel.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class BottomToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: (() => {homeViewModel.toggleMap()}),
            child: homeViewModel.isMap
                ? Icon(
                    Icons.map,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
          ),
          ElevatedButton(
              onPressed: (() {
                displayBottomSheet(context);
              }),
              child: Icon(Icons.camera_enhance_rounded, color: Colors.white)),
          ElevatedButton(
              onPressed: () {
                print("Profile Icon CLicked");
              },
              child: Icon(Icons.people, color: Colors.white))
        ],
      ),
    );
  }
}
