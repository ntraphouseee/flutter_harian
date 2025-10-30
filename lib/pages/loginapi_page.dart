import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/controller/loginapi_controller.dart';

class LoginApiPage extends StatelessWidget {
  final loginC = Get.put(LoginApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login Page",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: loginC.username,
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: loginC.password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Obx(() {
                  return ElevatedButton(
                    onPressed:
                        loginC.isLoading.value ? null : () => loginC.login(),
                    child: loginC.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Login"),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
