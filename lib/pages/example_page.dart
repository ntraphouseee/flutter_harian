import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:latihan/controller/example_controller.dart';
import 'package:latihan/pages/mobile/example_mobile.dart';
import 'package:latihan/pages/widescreen/example_widescreendart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});

  //nanti di inject sendiri di binding
  final controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          //detection widthnya
          controller.updateLayout(constraints);
          //transforming load page
          return Obx(()=> controller.isMobile.value 
          ? ExampleMobile() 
          : ExampleWidescreen());
        }),
    );
  }
}