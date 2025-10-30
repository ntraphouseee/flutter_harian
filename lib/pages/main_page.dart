import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/controller/bottom_nav_controller.dart';
import 'package:latihan/pages/calculator_page.dart';
import 'package:latihan/pages/football_page.dart';
import 'package:latihan/pages/profile_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final BottomNavController navController = Get.put(BottomNavController());

  final List<Widget> pages = [
    CalculatorPage(),
    FootballPage(),
    ProfilePage(),
  ];

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
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text("Menu Utama", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            _drawerItem(Icons.calculate, 'Calculator', 0),
            _drawerItem(Icons.sports_soccer, 'Football Players', 1),
            _drawerItem(Icons.person, 'Profile', 2),
          ],
        ),
      ),
      body: Obx(() => IndexedStack(
            index: navController.currentIndex.value,
            children: pages,
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: navController.changePage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calc'),
            BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Football'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, int index) {
    return Obx(
      () => ListTile(
        leading: Icon(icon),
        title: Text(title),
        selected: navController.currentIndex.value == index,
        onTap: () {
          navController.changePage(index);
          Get.back();
        },
      ),
    );
  }
}
