import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/ui/screens/post/CreatePost.dart';
import 'package:mobile/view-models/PostViewModel.dart';
import 'package:provider/provider.dart';

void displayBottomSheet(BuildContext context) {
  final postViewModel = Provider.of<PostViewModel>(context, listen: false);
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10)),
                        child: const Icon(
                          Icons.post_add_sharp,
                          size: 50,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreatePost()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("New"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10)),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 50,
                        ),
                        onPressed: () async {
                          try {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            if (image == null) return;
                            final tempImage = File(image.path);
                            postViewModel.setImage(tempImage);
                          } on PlatformException catch (e) {
                            print(e);
                          }
                          ;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Camera"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10)),
                        child: const Icon(
                          Icons.image_search,
                          size: 50,
                        ),
                        onPressed: () async {
                          try {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (image == null) return;
                            final tempImage = File(image.path);
                            postViewModel.setImage(tempImage);
                          } on PlatformException catch (e) {
                            print(e);
                          }
                          ;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Images"),
                      )
                    ],
                  ),
                ]),
          ),
        );
      });
}
