import 'package:app_map_sekolah/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // Gambar Mahasiswa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/images/splashscreen.jpg', // Ganti sesuai nama file kamu
                height: 200,
              ),
            ),

            const SizedBox(height: 20),

            // Teks Sambutan
            const Text(
              'Selamat Datang di Aplikasi MAP Sekolah',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const Spacer(),

            // Tombol Login
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
