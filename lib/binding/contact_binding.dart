import 'package:get/get.dart';
import 'package:latihan/controller/contact_controller.dart';
import 'package:latihan/helper/database_helper.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactController());
    Get.lazyPut(() => DBHelper());
  }
}
