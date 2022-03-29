import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view-models/PostViewModel.dart';

class PostView extends StatelessWidget {
  final int index;
  PostView(this.index);

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context, listen: true);
    return Container(
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
                  style: TextStyle(color: Colors.grey),
                ),
                Row(children: [
                  Icon(
                    Icons.music_note,
                    size: 15.0,
                    color: Colors.grey,
                  ),
                  Text('Artist name - Album name - song',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey))
                ]),
              ],
            ),
          )
        ]));
  }
}
