import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo atau Gambar
            Image.asset('assets/images/splashscreen.jpg', height: 150),
            const SizedBox(height: 30),

            // Form Login
            TextField(
              controller: controller.usernameController,
              decoration: const InputDecoration(
                labelText: 'Username (NIM)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Login
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.login,
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Login', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
