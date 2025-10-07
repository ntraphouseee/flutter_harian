import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/controller/bottom_nav_controller.dart';
import 'package:latihan/pages/calculator_page.dart';
import 'package:latihan/pages/football_page.dart';
import 'package:latihan/pages/profile_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final BottomNavController navController = Get.put(BottomNavController());

  // Halaman yang tersedia
  final List<Widget> pages = [
    CalculatorPage(),
    FootballPage(),
    ProfilePage(),
  ];

  // Judul halaman
  final List<String> pageTitles = const [
    "Calculator",
    "Football Players",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(pageTitles[navController.currentIndex.value])),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menu Utama',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => ListTile(
                leading: const Icon(Icons.calculate),
                title: const Text('Calculator'),
                selected: navController.currentIndex.value == 0,
                selectedTileColor: Colors.blue.withOpacity(0.1),
                onTap: () {
                  navController.changePage(0);
                  Navigator.pop(context); // Tutup drawer
                },
              ),
            ),
            Obx(
              () => ListTile(
                leading: const Icon(Icons.sports_soccer),
                title: const Text('Football Players'),
                selected: navController.currentIndex.value == 1,
                selectedTileColor: Colors.blue.withOpacity(0.1),
                onTap: () {
                  navController.changePage(1);
                  Navigator.pop(context);
                },
              ),
            ),
            Obx(
              () => ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                selected: navController.currentIndex.value == 2,
                selectedTileColor: Colors.blue.withOpacity(0.1),
                onTap: () {
                  navController.changePage(2);
                  Navigator.pop(context);
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Get.snackbar('Info', 'Settings clicked');
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Exit'),
              onTap: () {
                Navigator.pop(context);
                Get.snackbar('Info', 'Exit clicked');
              },
            ),
          ],
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: navController.currentIndex.value,
          children: pages,
        ),
      ),
    );
  }
}
