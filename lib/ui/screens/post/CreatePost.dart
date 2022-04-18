import 'package:flutter/material.dart';
import 'package:mobile/view-models/PostViewModel.dart';
import 'package:provider/provider.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // postViewModel.image != null
          //     ? Image.file(postViewModel.image,
          //         width: 120, height: 120, fit: BoxFit.cover)
          //     : Text("Loading.."),
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
        ],
      ),
    );
  }
}
