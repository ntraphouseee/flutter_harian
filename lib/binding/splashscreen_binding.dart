import 'package:get/get.dart';
import 'package:latihan/controller/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    // Inisialisasi SplashscreenController
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}
