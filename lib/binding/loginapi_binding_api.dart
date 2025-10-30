import 'package:get/get.dart';
import 'package:latihan/controller/loginapi_controller.dart';

class LoginApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginApiController>(() => LoginApiController());
  }
}
