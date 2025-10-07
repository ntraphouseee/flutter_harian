import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/helper/database_helper.dart';

class ContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  
  final names = <Map<String, dynamic>>[].obs;

  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

  Future<void> fetchNames() async {
    final data = await _dbHelper.getNames();
    names.assignAll(data);
  }

  Future<void> addName() async {
    final text = nameController.text.trim();
    if (text.isEmpty) return;

    await _dbHelper.insertName(text);
    nameController.clear();
    await fetchNames();
  }

  Future<void> updateName(int id, String newName) async {
    await _dbHelper.updateName(id, newName);
    await fetchNames();
  }

  Future<void> deleteName(int id) async {
    await _dbHelper.deleteName(id);
    await fetchNames();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
