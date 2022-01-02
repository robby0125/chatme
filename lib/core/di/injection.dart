import 'package:chatme/core/controllers/auth_controller.dart';
import 'package:chatme/core/controllers/database_controller.dart';
import 'package:get/get.dart';

abstract class Injection {
  static void provideInjection() {
    Get.put(DatabaseController());
    Get.put(AuthController());
  }
}