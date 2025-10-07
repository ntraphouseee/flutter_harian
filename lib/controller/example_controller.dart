import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ExampleController extends GetxController{
  
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints){
    isMobile.value = constraints.maxWidth < 600;
  }
}