import 'dart:developer';

import 'package:chatme/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNewUser({
    required String uid,
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

      await _firestore.collection('user').doc(uid).set(_newUser.toJson());

      log('Success adding new user to database!');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setUserOnlineStatus({
    required String userUid,
    required bool isOnline,
  }) async {
    final _ref = _firestore.collection('user').doc(userUid);
    await _ref.update({
      'isOnline': isOnline,
    });
  }

  Future<UserModel?> getUserByUserName({
    required String userName,
  }) async {
    final _querySnapshot = await _firestore
        .collection('user')
        .where('userName', isEqualTo: userName)
        .get();

    if (_querySnapshot.docs.isNotEmpty) {
      return UserModel.fromJson(_querySnapshot.docs.first.data());
    } else {
      return null;
    }
  }

  Future<UserModel?> getUserByEmail({
    required String email,
  }) async {
    final _querySnapshot = await _firestore
        .collection('user')
        .where('email', isEqualTo: email)
        .get();

    if (_querySnapshot.docs.isNotEmpty) {
      return UserModel.fromJson(_querySnapshot.docs.first.data());
    } else {
      return null;
    }
  }
}
