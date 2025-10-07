import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/controller/contact_controller.dart';
import 'package:latihan/widget/widget_textField.dart';
import 'package:latihan/widget/widget_button.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  void _showEditDialog(BuildContext context, int id, String currentName) {
    final TextEditingController editController = TextEditingController(text: currentName);

    Get.dialog(
      AlertDialog(
        title: const Text("Edit Contact Name"),
        content: CustomTextField(
          controller: editController,
          hintText: "Enter new name",
          obscureText: false,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.green),
            onPressed: () {
              final newName = editController.text.trim();
              if (newName.isNotEmpty) {
                controller.updateName(id, newName);
                Get.back();
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black54),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    obscureText: false,
                    controller: controller.nameController,
                    hintText: "Enter name",
                  ),
                ),
                const SizedBox(width: 8),
                WidgetButton(
                  text: "Save",
                  onPressed: controller.addName,
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.names.isEmpty) {
                return const Center(child: Text("No names yet."));
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.names.length,
                itemBuilder: (context, index) {
                  final item = controller.names[index];
                  final id = item['id'] as int;
                  final name = item['name'] as String;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text(name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.black),
                            onPressed: () => _showEditDialog(context, id, name),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => controller.deleteName(id),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
