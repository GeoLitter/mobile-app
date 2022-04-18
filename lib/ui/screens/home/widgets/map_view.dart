import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_map/plugin_api.dart';
// ignore: import_of_legacy_library_into_null_safe
import "package:latlong/latlong.dart" as latLng;
import 'package:mobile/view-models/PostsViewModel.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        // child:
        //     Stack(children: <Widget>[PostView(index), ActionsToolbar()])),
        child: FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(17.1899, -88.4976),
            zoom: 5.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(
              markers: Provider.of<PostsViewModel>(context).markers,
            ),
          ],
        ));
  }
}
