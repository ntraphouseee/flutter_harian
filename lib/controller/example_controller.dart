import 'package:get/get.dart';
import 'package:latihan/routes/routes.dart';

class ExampleController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print("🟢 ExampleController initialized");

    Future.delayed(const Duration(seconds: 3), () {
      print("➡️ Navigating to loginapi...");
      Get.offAllNamed(AppRoutes.loginapi);
    });
  }
}
