import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mad_sport_app/app/map/controller/map_controller.dart';

class MapCentersView extends GetView<MapController> {
  const MapCentersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: (){
          controller.goToMyLocation();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            //  borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.circle,
              color: Colors.black
          ),
          child: const Center(child:
          Icon(Icons.gps_fixed,color: Colors.white,),),
        ),
      ),
      body: Obx(()=>
          GoogleMap(
        initialCameraPosition: CameraPosition(
            target: controller.initialCameraPosition.value),
        onTap: (position){
          controller.handleTapped(position);
        },
        mapType: MapType.normal,
        onMapCreated: controller.onMapCreated,
            markers: Set.from(controller.myMarker),
            zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
      )
      ),
    );
  }
}
