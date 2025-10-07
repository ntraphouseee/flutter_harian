import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExampleMobile extends StatelessWidget {
  const ExampleMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ini mobilescreen"),),
      body: Center(child: Text("ini contoh mobilescreen"),),
    );
  }
}