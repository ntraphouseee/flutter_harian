import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/controller/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});
  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Splashscreen Page",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
