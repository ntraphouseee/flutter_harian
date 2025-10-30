import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/controller/loginapi_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final LoginApiController loginC = Get.put(LoginApiController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(radius: 60, backgroundColor: Colors.blueAccent, child: Icon(Icons.person, size: 70, color: Colors.white)),
                  const SizedBox(height: 16),
                  const Text("Aldestha Nendrayanto", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  const Text("11 PPLG 1", style: TextStyle(fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 30),

                  ElevatedButton.icon(
                    onPressed: () => loginC.logout(), // ✅ sudah tidak error
                    icon: const Icon(Icons.logout),
                    label: const Text("Logout"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
