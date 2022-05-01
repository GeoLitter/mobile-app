import 'package:flutter/material.dart';
import 'package:mobile/ui/screens/post/PostDetails.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

import '../../../../view-models/PostsViewModel.dart';

class PostView extends StatelessWidget {
  final int index;
  PostView(this.index);

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostsViewModel>(context, listen: true);
    return InkWell(
      onTap: () {
        var postId = postViewModel.posts[index]['_id'];
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PostDetails(postId)));
      },
      child: Container(
          padding: EdgeInsets.all(15),
          child: Column(children: <Widget>[
            Expanded(
                child: Image.network(
              '${postViewModel.posts?[index]['postImage'] ?? "https://filetandvine.com/wp-content/uploads/2015/10/pix-vertical-placeholder.jpg"}',
              fit: BoxFit.cover,
            )),
            Container(
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '@${postViewModel.posts?[index]?['profile']?['handle'] ?? postViewModel.posts?[index]?['name']}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  Text(
                    '${postViewModel.posts?[index]['description'] ?? "No Description"}',
                    style: TextStyle(
                        color: Colors.grey, overflow: TextOverflow.ellipsis),
                  ),
                  Row(children: [
                    Icon(
                      Icons.place,
                      size: 15.0,
                      color: Colors.grey,
                    ),
                    Text(
                        'Location - lat ${postViewModel.posts?[index]['lat']} long ${postViewModel.posts?[index]['lat']}',
                        style: TextStyle(fontSize: 12.0, color: Colors.grey))
                  ]),
                ],
              ),
            )
          ])),
    );
  }
}
