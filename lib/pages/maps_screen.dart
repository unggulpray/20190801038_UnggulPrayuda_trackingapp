import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:trackingapp/bloc/application_bloc.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreen createState() => new _MapsScreen();
}

var latitude = -6.100059;
var longitude = 106.5166521;

void getCurrentPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Future<Position> location() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  var lastLocation = await Geolocator.getLastKnownPosition();

  latitude = lastLocation.latitude;
  longitude = lastLocation.longitude;
}

List<Marker> _marker = [];
List<Marker> _list = const [
  Marker(
    markerId: MarkerId("1"),
    position: LatLng(-6.100059, 106.5166521),
    infoWindow: InfoWindow(title: "posisi sekarang"),
  )
];

Completer<GoogleMapController> _controller = Completer();

class _MapsScreen extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    // final applicationBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Tracking Map"),
      ),
      body: ListView(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Search Location'),
          ),
          Container(
            height: 500.0,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longitude),
                zoom: 16,
              ),
              markers: Set<Marker>.of(_list),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment(-0.9, -0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Places Nearby",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("latitude: $latitude dan longitude: $longitude"),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    getCurrentPosition();
                  },
                  child: Text("Hospital"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    // TODO: implement build
  }
}
