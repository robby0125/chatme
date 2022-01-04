import 'dart:developer';

import 'package:chatme/core/controllers/database_controller.dart';
import 'package:chatme/ui/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      final _userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _user.value = _userCredential.user;

      if (user != null) {
        Get.clearRouteTree();
        Get.toNamed(HomePage.routeName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
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
      final _userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final _registeredUser = _userCredential.user;

      if (_registeredUser != null) {
        await _registeredUser.updateDisplayName(fullName);
        await _databaseController.addNewUser(
          email: email,
          fullName: fullName,
          userName: userName,
        );
        login(email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
