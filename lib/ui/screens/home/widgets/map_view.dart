import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_map/plugin_api.dart';
// ignore: import_of_legacy_library_into_null_safe
import "package:latlong/latlong.dart" as latLng;

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

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
              markers: [
                Marker(
                  width: 60.0,
                  height: 60.0,
                  point: latLng.LatLng(17.1523, -89.0800),
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
              ],
            ),
          ],
        ));
  }
}
