import 'dart:developer';

import 'package:chatme/core/controllers/database_controller.dart';
import 'package:chatme/ui/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseController _databaseController = Get.find<DatabaseController>();
  final _user = Rx<User?>(null);

  User? get user => _user.value;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      if (EasyLoading.isShow) EasyLoading.dismiss();

      EasyLoading.show(status: 'Please wait...\nChatMe signin you in.');

      final _userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _user.value = _userCredential.user;

      if (user != null) {
        log('user uid = ${user!.uid}');

        await _databaseController.setUserOnlineStatus(
          userUid: user!.uid,
          isOnline: true,
        );

        if (EasyLoading.isShow) EasyLoading.dismiss();

        Get.clearRouteTree();
        Get.toNamed(HomePage.routeName);
      }
    } on FirebaseAuthException catch (e) {
      if (EasyLoading.isShow) EasyLoading.dismiss();

      if (e.code == 'user-not-found') {
        EasyLoading.showError(
          'Oops!\nUser not found, please make sure your email is correct!',
          duration: const Duration(seconds: 3),
        );
      } else if (e.code == 'wrong-password') {
        EasyLoading.showError(
          'Oops!\nYour password is wrong, please enter the correct password and log in again!',
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> register({
    required String fullName,
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      EasyLoading.show(
        status: 'Please wait...\nChatMe is registering you.',
        dismissOnTap: false,
      );

      final _userNameExist = await _databaseController.getUserByUserName(
        userName: userName,
      );

      if (_userNameExist != null) {
        EasyLoading.showError(
          'Oops!\nThis user name is already exist, please choose another user name!',
          duration: const Duration(seconds: 3),
        );
        return;
      } else {
        final _emailExist = await _databaseController.getUserByEmail(
          email: email,
        );

        if (_emailExist != null) {
          EasyLoading.showError(
            'Oops!\nThis email is already exist, please choose another email!',
            duration: const Duration(seconds: 3),
          );
          return;
        }
      }

      final _userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final _registeredUser = _userCredential.user;

      if (_registeredUser != null) {
        await _registeredUser.updateDisplayName(fullName);
        await _databaseController.addNewUser(
          uid: _registeredUser.uid,
          email: email,
          fullName: fullName,
          userName: userName,
        );
        login(email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      if (EasyLoading.isShow) EasyLoading.dismiss();

      if (e.code == 'weak-password') {
        EasyLoading.showError(
          'Oops!\nYour password is to weak, try another password!',
          duration: const Duration(seconds: 3),
        );
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.showError(
          'Oops!\nThis email is already registered!',
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
