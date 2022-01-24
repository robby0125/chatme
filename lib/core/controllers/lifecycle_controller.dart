import 'dart:developer';

import 'package:chatme/core/controllers/auth_controller.dart';
import 'package:chatme/core/controllers/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class LifecycleController extends GetxController with WidgetsBindingObserver {
  final _databaseController = Get.find<DatabaseController>();
  final _authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.paused:
        _databaseController.setUserOnlineStatus(
          userUid: _authController.user!.uid,
          isOnline: false,
        );

        break;

      case AppLifecycleState.resumed:
        _databaseController.setUserOnlineStatus(
          userUid: _authController.user!.uid,
          isOnline: true,
        );

        break;

      default:
        break;
    }
  }
}
