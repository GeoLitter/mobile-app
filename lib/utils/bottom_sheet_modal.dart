import 'package:flutter/material.dart';

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              )),
          height: MediaQuery.of(context).size.height * 0.25,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 23, right: 23, bottom: 30, top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        height: 80,
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.post_add,
                            color: Colors.green[400],
                            size: 60,
                          ),
                        ),
                      ),
                      Text("New")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        height: 80,
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.green[400],
                            size: 60,
                          ),
                        ),
                      ),
                      Text("Camera")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        height: 80,
                        width: 80,
                        child: InkWell(
                          onTap: () {
                            print("Clicked");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.image_search_outlined,
                              color: Colors.green[400],
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                      Text("Images")
                    ],
                  )
                ]),
          ),
        );
      });
}
