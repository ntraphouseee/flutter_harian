import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latihan/routes/routes.dart';

class ClientNetwork {
  static const baseUrl = "http://10.0.2.2:3000/";
}

class LoginApiController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  var isLoading = false.obs;

  Future<void> login() async {
    final user = username.text.trim();
    final pass = password.text.trim();

    if (user.isEmpty || pass.isEmpty) {
      Get.snackbar("Error", "Username dan password tidak boleh kosong");
      return;
    }

    isLoading.value = true;

    try {
      final url = Uri.parse("${ClientNetwork.baseUrl}login"); // endpoint Node.js dummy API

      debugPrint("📡 Request POST $url with username=$user");

      final response = await http
          .post(
            url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "username": user,
              "password": pass,
            }),
          )
          .timeout(const Duration(seconds: 12));

      debugPrint("📥 Response (${response.statusCode}): ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'] as String?;

        if (token != null && token.isNotEmpty) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          await prefs.setString('username', data['user']?['username'] ?? user);

          Get.snackbar(
            "Sukses",
            "Login berhasil sebagai ${data['user']?['username'] ?? user}",
            snackPosition: SnackPosition.TOP,
          );

          // Arahkan ke halaman utama (misal calculator)
          Get.offAllNamed(AppRoutes.calculator);
        } else {
          Get.snackbar("Gagal", "Login berhasil tapi token kosong");
        }
      } else {
        String msg = "Login gagal (kode ${response.statusCode})";
        try {
          final data = jsonDecode(response.body);
          if (data is Map && data['message'] != null) {
            msg = data['message'];
          }
        } catch (_) {}
        Get.snackbar("Gagal", msg);
      }
    } on TimeoutException {
      Get.snackbar("Error", "Server tidak merespons (timeout)");
    } catch (e, s) {
      debugPrint("❌ Exception login: $e\n$s");
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.snackbar("Logout", "Berhasil logout");
    Get.offAllNamed(AppRoutes.loginapi);
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
    super.onClose();
  }
}
