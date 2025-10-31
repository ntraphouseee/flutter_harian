import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/controller/splashscreen_controller.dart';
import 'package:lottie/lottie.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});
  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200], // Background abu/putih
        child: Stack(
          children: [
            // Tulisan di atas layar
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Column(
                children: const [
                  Text(
                    "Latihan App",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Selamat Datang! 🚀",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            // Loading Lottie di tengah layar
            Center(
              child: SizedBox(
                width: size.width * 1.0,
                height: size.width * 1.0,
                child: Lottie.asset(
                  'lib/assets/animations/splash_logo.json',
                  repeat: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
