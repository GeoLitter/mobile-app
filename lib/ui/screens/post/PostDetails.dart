import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_map/flutter_map.dart';
// ignore: import_of_legacy_library_into_null_safe
import "package:latlong/latlong.dart" as latLng;
import 'package:mobile/ui/components/comments_bottomsheet.dart';
import 'package:provider/provider.dart';

import '../../../view-models/PostsViewModel.dart';

class PostDetails extends StatelessWidget {
  final String postId;
  const PostDetails(this.postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostsViewModel>(context, listen: true);
    final data = postViewModel.getPostData(postId);
    print(data);
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
      body: SingleChildScrollView(
        child: Container(
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
              //post info actions, comments, share
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                        onPressed: () {
                          displayCommentsBottomSheet(context);
                        },
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
                  ),
                ),
              ),
              Container(
                height: 250,
                child: FlutterMap(
                  options: MapOptions(
                    center: latLng.LatLng(17.1899, -88.4976),
                    zoom: 5.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: latLng.LatLng(51.5, -0.09),
                          builder: (ctx) => Container(
                            child: FlutterLogo(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Data Assesment"),
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(
                            Icons.check_circle,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Unresolved',
                              style: TextStyle(fontSize: 12)),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Divider(
                          thickness: 2,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(
                            Icons.check_circle,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Unresolved',
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Divider(
                          thickness: 2,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(
                            Icons.check_circle,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Unresolved',
                              style: TextStyle(fontSize: 12)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
