// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_map/flutter_map.dart';
// ignore: import_of_legacy_library_into_null_safe
import "package:latlong/latlong.dart" as latLng;
import 'package:mobile/data/repositories/post_repo.dart';

import '../ui/screens/post/PostDetails.dart';
import '../utils/alert_info_modal.dart';

class PostViewModel extends ChangeNotifier {
  List? _posts;
  final PostsRepo _postsRepo = PostsRepo();
  bool _isLoading = false;

  late List<latLng.LatLng> _markerPositions;

  get isLoading => _isLoading;
  get posts => _posts;

  List<Marker> get markers => _markerPositions
      .map(
        (markerPosition) => Marker(
          width: 60.0,
          height: 60.0,
          point: markerPosition,
          builder: (ctx) => InkWell(
            onLongPress: (() {
              Navigator.push(
                  ctx, MaterialPageRoute(builder: (context) => PostDetails()));
            }),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      _posts?[_markerPositions.indexOf(markerPosition)]
                          ['postImage']),
                  radius: 60.0,
                ),
              ),
            ),
          ),
        ),
      )
      .toList();

  setMarkers(List<latLng.LatLng> markers) {
    _markerPositions = markers;
  }

  set setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future getPostData(context) async {
    try {
      Response response = await _postsRepo.getPosts();
      if (response.statusCode == 401)
        displayAlertModal(context, "Not Authenticated");
      if (response.statusCode == 200 || response.statusCode == 201) {
        _posts = response.data['data'];
        final data = _posts!
            .map((post) => latLng.LatLng(double.parse(post['lat'] ?? "1.00"),
                double.parse(post['long'] ?? "1.00")))
            .toList();
        setMarkers(data);
        setLoading = true;
      }
    } on DioError catch (error) {
      displayAlertModal(context, error.response?.data['message']);
    }
  }

  Future likePost(context) async {
    try {
      Response response = await _postsRepo.likePost("");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Post liked");
      }
    } on DioError catch (error) {
      displayAlertModal(context, error.response?.data['message']);
    }
  }
}
