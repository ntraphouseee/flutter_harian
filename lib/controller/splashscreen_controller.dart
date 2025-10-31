import 'package:get/get.dart';
import 'package:latihan/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateFromSplash();
  }

  Future<void> navigateFromSplash() async {
    await Future.delayed(const Duration(seconds: 5));

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(AppRoutes.calculator);
    } else {
      Get.offAllNamed(AppRoutes.loginapi);
    }
  }
}
