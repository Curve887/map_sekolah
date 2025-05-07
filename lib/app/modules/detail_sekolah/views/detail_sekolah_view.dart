import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_sekolah_controller.dart';

class DetailSekolahView extends GetView<DetailSekolahController> {
  const DetailSekolahView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data school dari argument
    final school = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(school.name), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'http://192.168.1.18/api_realprj/image/${school.imagePath}',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Text("Gagal memuat gambar"),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              school.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Akreditasi: ${school.accreditation}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Tahun Berdiri: ${school.establishedYear}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sejarah Sekolah:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              school.history,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
