import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wemapgl/wemapgl.dart';

class Routing extends StatefulWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  _RoutingState createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  WeMapSearchAPI searchAPI = WeMapSearchAPI();
  late WeMapPlace originPlace;
  late WeMapPlace destinationPlace;

  LatLng latLng = LatLng(20.037, 105.7876);

  @override
  void initState() {
    getPlaces();
    super.initState();
  }

  void getPlaces() async {
    print("Hello");
    print(WeMapPlace(description: "Vị trí của bạn"));
  }

  @override
  Widget build(BuildContext context) {
    return WeMapDirection(
        // originPlace: originPlace,
        // destinationPlace: destinationPlace,
        originIcon: "assets/symbols/origin.png",
        destinationIcon: "assets/symbols/destination.png");
  }
}
