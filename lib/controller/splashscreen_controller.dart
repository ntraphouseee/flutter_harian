// lib/controller/splashscreen_controller.dart (Contoh)

import 'package:get/get.dart';
import 'package:latihan/routes/routes.dart';
import 'package:latihan/main.dart'; // <<< PASTI ADA

class SplashscreenController extends GetxController {
  
  @override
  void onInit() {
    super.onInit();
    // Jika checkLogin() crash, whitescreen bisa muncul
    checkLogin(); 
  }

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    
    String? savedUsername = prefs.getString('username'); // Menggunakan prefs global
    
    if (savedUsername != null) {
      // Navigasi ke Halaman Kalkulator jika sudah login
      Get.offAllNamed(AppRoutes.calculator);
    } else {
      // Simpan data dan navigasi ke Kalkulator (Simulasi Login)
      prefs.setString('username', 'AldestaN'); 
      Get.offAllNamed(AppRoutes.calculator); // <<< Navigasi HARUS terjadi
    }
  }
}
