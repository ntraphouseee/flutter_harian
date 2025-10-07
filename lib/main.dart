
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/routes/pages.dart';
import 'package:latihan/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  prefs = await SharedPreferences.getInstance();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Calculator App',
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      initialRoute: AppRoutes.examplescreen,
      getPages: AppPages.routes,
    );
  }
}
