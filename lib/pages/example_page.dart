import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/controller/example_controller.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});

  final ExampleController controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splashscreen (Example Page)",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
