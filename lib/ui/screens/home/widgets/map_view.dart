import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_map/plugin_api.dart';
// ignore: import_of_legacy_library_into_null_safe
import "package:latlong/latlong.dart" as latLng;
import 'package:mobile/view-models/PostViewModel.dart';
import 'package:provider/provider.dart';

class MapView extends StatelessWidget {
  final List<latLng.LatLng> _markerPositions = [
    latLng.LatLng(44.421, 10.404),
    latLng.LatLng(45.683, 10.839),
    latLng.LatLng(45.246, 5.783),
  ];
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
              markers: Provider.of<PostViewModel>(context).markers,
            ),
          ],
        ));
  }

  List<Marker> get _markers => _markerPositions
      .map(
        (markerPosition) => Marker(
          width: 60.0,
          height: 60.0,
          point: markerPosition,
          builder: (ctx) => Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(60))),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media0.giphy.com/media/b5xDLakZRxJ6M/200.gif"),
                radius: 60.0,
              ),
            ),
          ),
        ),
      )
      .toList();
}
