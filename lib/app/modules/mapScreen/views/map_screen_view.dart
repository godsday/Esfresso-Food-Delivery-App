// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/map_screen_controller.dart';

class MapScreenView extends GetView<MapScreenController> {
  MapScreenView({Key? key}) : super(key: key);
 // Completer<GoogleMapController> _controller = Completer();
 late GoogleMapController googleMapController;
  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.323,
  );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.83,
  //     target: LatLng(17.42796133580664, 22.085749655962),
  //     tilt: 59.4407,
  //     zoom: 19.15);

  // static final Marker _kgoogleplexMarker = Marker(
  //     markerId: MarkerId('_kGooglePlex'),
  //     infoWindow: InfoWindow(title: 'Current Location'),
  //     icon: BitmapDescriptor.defaultMarker,
  //     position: LatLng(12.24343453, 23));

  // static final Marker _kgoogleWhereMarker = Marker(
  //     markerId: MarkerId('_kGoogleOther'),
  //     infoWindow: InfoWindow(title: 'other Location'),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //     position: LatLng(42.24343453, 43.2342));

  // static final Polyline _kPolyline = Polyline(
  //   polylineId: PolylineId('_kPolyline'),
  //   points: [LatLng(42.24343453, 43.2342), LatLng(12.24343453, 23)],
  //   width: 5,
  // );

  // static final Polygon _kploygon = Polygon(
  //     polygonId: PolygonId('_kploygon'),
  //     points: [
  //       LatLng(42.24343453, 43.2342),
  //       LatLng(12.24343453, 23),
  //       LatLng(13.24343453, 24),
  //       LatLng(14.24343453, 25),
  //     ],
  //     strokeWidth: 5,
  //     fillColor: Colors.transparent);

  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          // markers: {
          //  // _kgoogleplexMarker, _kgoogleWhereMarker
          //   },
          // polylines: {
          //   _kPolyline,
          // },
        //  polygons: {_kploygon},
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: 
           (GoogleMapController controller) {
          //   _controller.complete(controller);
          googleMapController =controller;
          },
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
       // hoverColor: Colors.amber,
        onPressed: () async {
          print('clicked');
          Position position = await _determinePosition();
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14),
          ));
          markers.clear();
          markers.add(Marker(markerId: MarkerId('current location'),position: LatLng(position.latitude,position.longitude)));
         // googleMapController.animateCamera(cameraUpdate)
        },
        child: Icon(Icons.location_history),
      ),
    );
  }

  // Future<void> _gotolake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permisssion;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("location service are desabled");
    }

    permisssion = await Geolocator.checkPermission();
    if (permisssion == LocationPermission.denied) {
      permisssion = await Geolocator.requestPermission();
      if (permisssion == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permisssion == LocationPermission.deniedForever) {
      return Future.error("Location permission are permanenty denied");
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
