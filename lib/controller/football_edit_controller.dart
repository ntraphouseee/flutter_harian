import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/controller/football_controller.dart';

class FootballEditController extends GetxController {
  final FootballController footballController = Get.find();

  late TextEditingController nameController;
  late TextEditingController positionController;
  late TextEditingController teamController;

  late int index;
  late Player selectedPlayer;

  @override
  void onInit() {
    super.onInit();

    selectedPlayer = Get.arguments as Player;
    index = footballController.players.indexWhere(
      (p) => p.name == selectedPlayer.name && p.team == selectedPlayer.team,
    );

    nameController = TextEditingController(text: selectedPlayer.name);
    positionController = TextEditingController(text: selectedPlayer.position);
    teamController = TextEditingController(text: selectedPlayer.team);
  }

  @override
  void onClose() {
    nameController.dispose();
    positionController.dispose();
    teamController.dispose();
    super.onClose();
  }

  void saveChanges() {
    final updatedPlayer = footballController.players[index].copyWith(
      name: nameController.text,
      position: positionController.text,
      team: teamController.text,
    );

    footballController.players[index] = updatedPlayer;
    Get.back();
  }
}
