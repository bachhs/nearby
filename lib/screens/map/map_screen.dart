import 'package:flutter/material.dart';
import 'package:nearby/models/movie.dart';
import 'package:nearby/screens/details/details_screen.dart';
import 'package:wemapgl/wemapgl.dart';

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
    mapController.onSymbolTapped.add(_onSymbolTapped);
  }

  @override
  void dispose() {
    mapController.onSymbolTapped.remove(_onSymbolTapped);
    super.dispose();
  }

  void _onSymbolTapped(Symbol symbol) {
    print(symbol.data);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DetailsScreen(movie: movies[int.parse(symbol.id)])),
    );
  }

  void _onStyleLoadedCallback() {
    mapController.addSymbols([
      SymbolOptions(
        zIndex: 999999,
        geometry: LatLng(11.043377, 106.631708),
        iconImage: "assets/images/actor_1.png",
      ),
      SymbolOptions(
        zIndex: 999999,
        geometry: LatLng(21.036029, 105.782950),
        iconImage: "assets/images/actor_4.png",
      ),
      SymbolOptions(
        zIndex: 999999,
        geometry: LatLng(10.7935961, 106.6764416),
        iconImage: "assets/images/actor_2.png",
      ),
    ], [
      {'zero': 0, 'one': 1, 'two': 2},
      {'zero': 0, 'one': 1, 'two': 2},
      {'zero': 0, 'one': 1, 'two': 2},
    ]);
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
            onStyleLoadedCallback: _onStyleLoadedCallback,
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
