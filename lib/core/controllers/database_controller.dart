import 'dart:developer';

import 'package:chatme/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNewUser({
    required String email,
    required String fullName,
    required String userName,
  }) async {
    try {
      final _newUser = UserModel(
        fullName: fullName,
        userName: userName,
        email: email,
        profilePictUrl: '',
      );

      await _firestore.collection('user').add(_newUser.toJson());

      log('Success adding new user to database!');
    } catch(e) {
      log(e.toString());
    }
  }
}
