import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_map/flutter_map.dart';
// ignore: import_of_legacy_library_into_null_safe
import "package:latlong/latlong.dart" as latLng;
import 'package:mobile/ui/components/comments_bottomsheet.dart';
import 'package:mobile/view-models/PostDetailsViewModel.dart';
import 'package:provider/provider.dart';

class PostDetails extends StatefulWidget {
  final String postId;
  const PostDetails(this.postId, {Key? key}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final postDetailsViewModel =
        Provider.of<PostDetailsViewModel>(context, listen: false);
    postDetailsViewModel.getPostDetails(context, widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    final postDetailsViewModel =
        Provider.of<PostDetailsViewModel>(context, listen: true);
    final post = postDetailsViewModel.postDetails;
    print(post);
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
                    child: postDetailsViewModel.isLoading
                        ? Text('loading...')
                        : Text("@${post['profile']['handle'] ?? 'loading...'}"),
                  ),
                  Text(post?['date'] ?? 'loading...')
                ],
              ),
              //images/images
              Image(
                height: 400,
                fit: BoxFit.cover,
                image: postDetailsViewModel.isLoading
                    ? NetworkImage(
                        'https://www.sfu.ca/~mauricey/iat339/Project4/public_html/img/placeholder.gif')
                    : NetworkImage(post?['postImage'] ??
                        'https://cdn1.iconfinder.com/data/icons/business-company-1/500/image-512.png'),
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
                child: postDetailsViewModel.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : FlutterMap(
                        options: MapOptions(
                          center: latLng.LatLng(
                              double.parse(post?['lat'] ?? "0.00"),
                              double.parse(post?['long'] ?? "0.00")),
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
                                point: latLng.LatLng(
                                    double.parse(post?['lat'] ?? "0.00"),
                                    double.parse(post?['long'] ?? "0.00")),
                                builder: (ctx) => Container(
                                  child: Icon(Icons.location_on),
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
                          backgroundColor: Colors.red,
                          radius: 20,
                          child: Icon(
                            Icons.close_outlined,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Resolving',
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
                          backgroundColor: Colors.red,
                          radius: 20,
                          child: Icon(
                            Icons.close_rounded,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text('Resovled', style: TextStyle(fontSize: 12)),
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
