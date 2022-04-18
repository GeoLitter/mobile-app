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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            //description -input text
            //date captured - date picker
            //location - map instance
            //geoprivacy - open, obscured, private
            //hotspot
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
    );
  }
}
