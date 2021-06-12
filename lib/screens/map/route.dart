import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wemapgl/wemapgl.dart';

class Routing extends StatefulWidget {
  final String destination;
  const Routing({Key? key, required this.destination}) : super(key: key);

  @override
  _RoutingState createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  WeMapSearchAPI searchAPI = WeMapSearchAPI();
  late Future<WeMapPlace> destinationPlace;

  LatLng latLng = LatLng(20.037, 105.7876);

  @override
  void initState() {
    super.initState();
    setState(() {
      destinationPlace = getPlaces();
    });
  }

  Future<WeMapPlace> getPlaces() async {
    List<WeMapPlace> temp = await searchAPI.getSearchResult(
        widget.destination, latLng, WeMapGeocoder.Pelias);
    return temp[0];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: destinationPlace,
      builder: (context, AsyncSnapshot<WeMapPlace> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        if (snapshot.hasData) {
          var data = snapshot.data;

          return WeMapDirection(
              destinationPlace: data,
              originIcon: "assets/symbols/origin.png",
              destinationIcon: "assets/symbols/destination.png");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
