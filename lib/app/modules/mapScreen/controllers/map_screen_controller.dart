import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenController extends GetxController {

  late GoogleMapController googleMapController;


  @override
  void onInit() {
    
    
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

 LatLng destination=LatLng(12.25953,75.1352);
  
  void currentLocation()async{
           Position position = await _determinePosition();
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14),
               
           ),
           );
            destination=LatLng(position.latitude, position.longitude);
            update();
  }

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
    update();
    return position;
    
  }
}
