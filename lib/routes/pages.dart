// lib/routes/pages.dart

import 'package:get/get.dart';
import 'package:latihan/binding/contact_binding.dart';
import 'package:latihan/binding/example_binding.dart';
import 'package:latihan/binding/splashscreen_binding.dart'; 
import 'package:latihan/pages/calculator_page.dart';
import 'package:latihan/pages/contact_page.dart';
import 'package:latihan/pages/example_page.dart';
import 'package:latihan/pages/football_edit_page.dart';
import 'package:latihan/pages/football_page.dart';
import 'package:latihan/pages/main_page.dart';
import 'package:latihan/pages/profile_page.dart';
import 'package:latihan/pages/splashscreen_page.dart'; 
import 'package:latihan/routes/routes.dart';

// Ganti menjadi abstract class agar hanya berisi anggota statis (best practice)
abstract class AppPages {
  // 1. Definisikan INITIAL route (harus sama dengan AppRoutes.splashscreen)
  static const INITIAL = AppRoutes.splashscreen;

  // 2. Definisikan daftar rute statis
  // KARENA ISI LIST INI BUKAN CONSTANT MURNI (karena ada Binding), LIST UTAMA TIDAK MENGGUNAKAN 'const'
  static final routes = [
    GetPage(
      name: AppRoutes.calculator,
      // Hapus 'const' di sini untuk menghindari error meskipun CalculatorPage adalah const widget
      page: () => CalculatorPage(),
      // Tidak perlu binding di sini jika CalculatorController dimuat di MainPage
    ),
    
    // Rute yang membutuhkan Binding
    GetPage(
      name: AppRoutes.splashscreen,
      // Hapus 'const'
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(), // TIDAK MENGGUNAKAN const
    ),
    GetPage(
      name: AppRoutes.contact,
      page: () => ContactPage(), 
      binding: ContactBinding(), 
    ),

    // Rute tanpa Binding (diasumsikan tidak punya Controller spesifik)
    GetPage(
      name: AppRoutes.profile,
      // Hapus 'const'
      page: () => ProfilePage(), 
    ),
    GetPage(
      name: AppRoutes.mainPage,
      // Hapus 'const'
      page: () => MainPage(), 
    ),
    GetPage(
      name: AppRoutes.footballPlayers,
      page: () => FootballPage(), 
    ),
    GetPage(
      name: AppRoutes.footballEdit,
      page: () => FootballEditPage(), 
    ),
    GetPage(
      name: AppRoutes.examplescreen,
      page: () => ExamplePage(),
      binding: ExampleBinding() 
    ),
  ];
}
