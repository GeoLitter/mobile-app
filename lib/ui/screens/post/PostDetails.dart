import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post',
          style: TextStyle(color: Colors.black),
        ),
        leading: BackButton(
          color: Colors.black54,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            //post info - avatar, handle, date
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn5.vectorstock.com/i/1000x1000/51/99/icon-of-user-avatar-for-web-site-or-mobile-app-vector-3125199.jpg"),
                    radius: 20.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("@lmanzanero"),
                ),
                Text("22/04/12")
              ],
            ),
            //images/images
            Image(
              height: 400,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
            //tabs info, comments, map
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10)),
                  child: const Icon(
                    Icons.info_outline,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10)),
                  child: const Icon(
                    Icons.comment_outlined,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10)),
                  child: const Icon(
                    Icons.share,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
