import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            'MAP Sekolah',
            style: TextStyle(
              color: controller.isNightMode.value ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor:
              controller.isNightMode.value ? Colors.grey[900] : null,
          actions: [
            IconButton(
              icon: Icon(
                controller.isNightMode.value
                    ? Icons.brightness_7
                    : Icons.brightness_4,
              ),
              tooltip: controller.isNightMode.value ? "Standard" : "Night",
              onPressed: () {
                controller.toggleMapStyle();
              },
            ),
            IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                controller.toggleMapType();
              },
            ),
          ],
        ),
        body: GoogleMap(
          onMapCreated: controller.onMapCreated,
          initialCameraPosition: controller.initialPosition,
          mapType: controller.mapType.value,
          markers: controller.markers,
        ),
      ),
    );
  }
}
