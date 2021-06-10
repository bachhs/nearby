import 'package:flutter/material.dart';
import 'package:nearby/components/ePage.dart';
import 'package:nearby/models/movie.dart';
import 'package:nearby/screens/details/details_screen.dart';
import 'package:wemapgl/wemapgl.dart';

class FullMapPage extends EPage {
  FullMapPage() : super(const Icon(Icons.map), 'Full screen map');

  @override
  Widget build(BuildContext context) {
    return const FullMap();
  }
}

class FullMap extends StatefulWidget {
  const FullMap();

  @override
  State createState() => FullMapState();
}

class FullMapState extends State<FullMap> {
  late WeMapController mapController;
  int searchType = 1; //Type of search bar
  String searchInfoPlace = "Tìm kiếm ở đây"; //Hint text for InfoBar
  LatLng myLatLng = LatLng(21.038282, 105.782885);
  bool reverse = true;
  WeMapPlace? place;

  void _onMapCreated(WeMapController controller) {
    mapController = controller;
    controller.addSymbols([
      SymbolOptions(
        geometry: LatLng(21.036029, 105.782950),
        iconImage: "assets/images/actor_1.png",
      ),
      SymbolOptions(
        zIndex: 999999,
        geometry: LatLng(21.0379161, 105.7752536),
        iconImage: "assets/images/actor_1.png",
      ),
    ], [
      {'zero': 0, 'one': 1, 'two': 2},
      {'zero': 0, 'one': 1, 'two': 2}
    ]);
    controller.onSymbolTapped.add(_onSymbolTapped);
  }

  @override
  void dispose() {
    mapController.onSymbolTapped.remove(_onSymbolTapped);
    super.dispose();
  }

  void _onSymbolTapped(Symbol symbol) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsScreen(movie: movies[0])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          WeMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(21.036029, 105.782950),
              zoom: 16.0,
            ),
            onMapClick: (point, latlng, _place) async {
              place = _place;
            },
            onPlaceCardClose: () {
              // print("Place Card closed");
            },
            reverse: true,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationTrackingMode: MyLocationTrackingMode.Tracking,
            myLocationRenderMode: MyLocationRenderMode.GPS,
          ),
          WeMapSearchBar(
            location: myLatLng,
            onSelected: (_place) {
              setState(() {
                place = _place;
              });
              mapController.moveCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(target: place?.location, zoom: 14.0),
                ),
              );
              mapController.showPlaceCard?.call(place);
            },
            onClearInput: () {
              setState(() {
                place = null;
                mapController.showPlaceCard?.call(place);
              });
            },
          ),
        ],
      ),
    );
  }
}
