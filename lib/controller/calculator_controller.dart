import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final numberOneController = TextEditingController();
  final numberTwoController = TextEditingController();
  var result = ''.obs;

  @override
  void onClose() {
    numberOneController.dispose();
    numberTwoController.dispose();
    super.onClose();
  }

  void calculate(String operation, String numberOne, String numberTwo) {
    if (numberOne.isEmpty || numberTwo.isEmpty) {
      result.value = 'Error: Isi Kedua Kolom Angka';
      return;
    }

    double num1 = double.tryParse(numberOne) ?? double.nan;
    double num2 = double.tryParse(numberTwo) ?? double.nan;

    if (num1.isNaN || num2.isNaN) {
      result.value = 'Error: Isi Dengan Angka Yang Valid';
      return;
    }

    double calculatedResult = 0;
    
    switch (operation) {
      case '+':
        calculatedResult = num1 + num2;
        break;
      case '-':
        calculatedResult = num1 - num2;
        break;
      case '*':
        calculatedResult = num1 * num2;
        break;
      case '/':
        if (num2 != 0) {
          calculatedResult = num1 / num2;
        } else {
          result.value = 'Error: Pembagian Dengan Nol';
          return;
        }
        break;
      default:
        result.value = 'Pilih Operasi Yang Benar';
        return;
    }

    // Tampilkan hasil tanpa angka desimal jika bilangan bulat
    if (calculatedResult == calculatedResult.truncate()) {
      result.value = calculatedResult.truncate().toString();
    } else {
      // Atau gunakan 2 angka desimal jika pecahan
      result.value = calculatedResult.toStringAsFixed(2);
    }
  }
}