import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VolunteerMapsScreen extends StatefulWidget{
  VolunteerMapsScreenState createState() => VolunteerMapsScreenState();
}

class VolunteerMapsScreenState extends State<VolunteerMapsScreen>{

  Completer<GoogleMapController> _controller = Completer();


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _pleasantonCenter = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.6624312, -121.8746789),
      tilt: 1.0,
      zoom: 19.151926040649414);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _pleasantonCenter,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        )
      ),
    );
  }
}