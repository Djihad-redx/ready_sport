import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController{

  Rx<LatLng> initialCameraPosition = Rx<LatLng>(const LatLng(25.119952828933872,55.13093948364258)).obs();
  late GoogleMapController mapController;
  double zoomValue = 14;
  final myMarker = [];
  var zoom = 12.0.obs;
  late Position myPosition;

  void onMapCreated(GoogleMapController _cntlr) async {
    String style = await rootBundle.loadString("assets/style_map.json");
    mapController = _cntlr;
    mapController.setMapStyle(style);
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target:  LatLng(initialCameraPosition.value.latitude,initialCameraPosition.value.longitude), zoom: zoomValue),
      ),
    );
  }

  void handleTapped(LatLng tappedPoint) {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(tappedPoint.latitude, tappedPoint.longitude),
            zoom: 15),
      ),
    );
    print("My tapped Point $tappedPoint");

    initialCameraPosition.value =
        LatLng(tappedPoint.latitude, tappedPoint.longitude);
    myMarker.add(Marker(
        onDragEnd: (dragEndPosition) {},
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint));
  }

  void _updateZoom() {
    if (zoom.value == 13.0) {
      zoom(15);
    } else {
      zoom(13);
    }
  }

  void goToMyLocation() async {
    _updateZoom();
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
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
    myPosition = await Geolocator.getCurrentPosition();
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(myPosition.latitude, myPosition.longitude),
            zoom: zoom.value),
      ),
    );
    CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(myPosition.latitude, myPosition.longitude),
          zoom: zoom.value),
    );
  }

}