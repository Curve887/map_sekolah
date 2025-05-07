import 'package:app_map_sekolah/app/data/api/api_service.dart';
import 'package:app_map_sekolah/app/modules/detail_sekolah/views/detail_sekolah_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:app_map_sekolah/app/data/model/school_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  late GoogleMapController mapController;
  final mapType = MapType.normal.obs;
  final markers = <Marker>{}.obs;
  var isNightMode = false.obs;

  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(-0.305420, 100.369187),
    zoom: 10.0,
  );

  @override
  void onInit() {
    super.onInit();
    loadSchoolMarkers();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void toggleMapType() {
    mapType.value =
        mapType.value == MapType.normal ? MapType.satellite : MapType.normal;
  }

  void toggleMapStyle() async {
    if (isNightMode.value) {
      mapController.setMapStyle(null); // Kembali ke default
    } else {
      String style = await rootBundle.loadString(
        'assets/map_style/night_map.json',
      );
      mapController.setMapStyle(style);
    }
    isNightMode.toggle();
  }

  Future<void> loadSchoolMarkers() async {
    try {
      final schools = await ApiService.fetchSchools();
      final loadedMarkers =
          schools.map((school) {
            return Marker(
              markerId: MarkerId(school.id.toString()),
              position: LatLng(
                double.parse(school.latitude),
                double.parse(school.longitude),
              ),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'http://192.168.1.18/api_realprj/image/${school.imagePath}',
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Text("Gagal memuat gambar"),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          school.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text('Akreditasi: ${school.accreditation}'),
                        const SizedBox(height: 10),
                        Text('Tahun Berdiri: ${school.establishedYear}'),
                        const SizedBox(height: 20),
                        Text('Ra: ${school.rating}'),
                        const SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () {
                            Get.to(
                              () => DetailSekolahView(),
                              arguments: school,
                            );
                          },
                          child: Text('Kunjungi Sekolah'),
                        ),
                      ],
                    ),
                  ),
                  isScrollControlled: true,
                );
              },
            );
          }).toSet();

      markers.value = loadedMarkers;
    } catch (e) {
      print("Error loading markers: $e");
    }
  }
}
