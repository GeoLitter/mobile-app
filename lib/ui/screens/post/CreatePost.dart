import 'package:flutter/material.dart';
import 'package:mobile/view-models/PostViewModel.dart';
import 'package:provider/provider.dart';

import '../../constants/button_styles.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(color: Colors.black),
        ),
        leading: BackButton(
          color: Colors.black54,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Image.file(postViewModel.image,
                          width: 150, height: 150, fit: BoxFit.cover),
                      Positioned(
                        top: -10,
                        right: -10,
                        child: InkWell(
                          onTap: () {
                            print('delete image from List');
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 15,
                            child: IconButton(
                              icon: Icon(
                                Icons.close,
                                size: 15,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //hastags - auto generated
                //title - auto generated
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.title_outlined),
                      hintText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                //description -input text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.description),
                      hintText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                //date captured - date picker
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (() async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: postViewModel.selectedDate,
                          firstDate: DateTime(2019, 8),
                          lastDate: DateTime(2100));
                      postViewModel.setDate(picked);
                    }),
                    child: AbsorbPointer(
                      child: TextField(
                        controller: postViewModel.dateController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.date_range),
                          hintText: 'Date',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                //location - map instance
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      print("load map bottom sheet");
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.location_on),
                          hintText: 'No Location',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                //geoprivacy - open, obscured, private
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      print("load GeoPrivacy bottom sheet");
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.privacy_tip_outlined),
                          hintText: 'Geoprivacy',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                //hotspot
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      print("load Cluster Selection");
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.data_array),
                          hintText: 'Add to a cluster',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                //upload button
                SafeArea(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextButton(
                      style: flatButtonStyle,
                      onPressed: () async {},
                      child: Text("Submit"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
