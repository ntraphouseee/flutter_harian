
import 'package:get/get.dart';
import 'package:latihan/controller/example_controller.dart';

class ExampleBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController());
  }
}