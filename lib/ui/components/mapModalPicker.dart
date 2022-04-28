import 'package:flutter/material.dart';
import 'package:mobile/ui/screens/home/widgets/map_view.dart';

void displayMapModalPicker(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              )),
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Lat: 023klkj"),
                      Text("Long: 023klkj"),
                    ],
                  ),
                ),
              ),
              Expanded(child: MapView()),
            ],
          ),
        );
      });
}
