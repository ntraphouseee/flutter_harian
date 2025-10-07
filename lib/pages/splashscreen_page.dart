import 'package:flutter/material.dart';
import 'package:latihan/controller/example_controller.dart';
import 'package:get/get.dart';

class SplashscreenPage extends StatelessWidget {
   SplashscreenPage({super.key});
  final controller = Get.find<ExampleController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text('Splashscreen Page'))),
    );
  }
}