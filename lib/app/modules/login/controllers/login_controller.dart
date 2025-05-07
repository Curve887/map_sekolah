import 'package:app_map_sekolah/app/data/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  void login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "username dan Password wajib diisi");
      return;
    }

    isLoading.value = true;
    try {
      final response = await ApiService.login(username, password);
      if (response['status'] == true) {
        Get.snackbar("Sukses", response['message']);
        Get.offAllNamed('/home'); // Ganti dengan rute MyHomePage
      } else {
        Get.snackbar("Gagal", response['message']);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
