import 'package:get/get.dart';
import 'package:latihan/binding/calculator_binding.dart';
import 'package:latihan/binding/contact_binding.dart';
import 'package:latihan/binding/example_binding.dart';
import 'package:latihan/binding/loginapi_binding_api.dart';
import 'package:latihan/binding/splashscreen_binding.dart';
import 'package:latihan/pages/calculator_page.dart';
import 'package:latihan/pages/contact_page.dart';
import 'package:latihan/pages/example_page.dart';
import 'package:latihan/pages/football_edit_page.dart';
import 'package:latihan/pages/football_page.dart';
import 'package:latihan/pages/loginapi_page.dart';
import 'package:latihan/pages/main_page.dart';
import 'package:latihan/pages/profile_page.dart';
import 'package:latihan/pages/splashscreen_page.dart';
import 'package:latihan/routes/routes.dart';

abstract class AppPages {
  static const INITIAL = AppRoutes.splashscreen;

  static final routes = [
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: AppRoutes.examplescreen,
      page: () => ExamplePage(),
      binding: ExampleBinding(),
    ),
    GetPage(
      name: AppRoutes.loginapi,
      page: () => LoginApiPage(),
      binding: LoginApiBinding(),
    ),
    GetPage(
      name: AppRoutes.calculator,
      page: () => CalculatorPage(),
      binding: CalculatorBinding(),
    ),
    GetPage(name: AppRoutes.contact, page: () => ContactPage(), binding: ContactBinding()),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
    GetPage(name: AppRoutes.footballPlayers, page: () => FootballPage()),
    GetPage(name: AppRoutes.footballEdit, page: () => FootballEditPage()),
    GetPage(name: AppRoutes.mainPage, page: () => MainPage()),
  ];
}
