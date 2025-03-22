import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sentilytics/widget/auth_error_dialog.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(
    String uid,
    String name,
    String email,
    bool premiumUser,
    BuildContext context,
  ) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'name': name,
        'email': email,
        'premiumUser': premiumUser,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      AuthErrorDialog.showErrorDialog(
        context,
        e.message ?? "Error saving user data.",
      );
    }
  }

  Future<void> upgradeUserToPremium(String uid, BuildContext context) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'premiumUser': true,
        'upgradedAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      AuthErrorDialog.showErrorDialog(
        context,
        e.message ?? "Error upgrading user.",
      );
    }
  }

  Future<void> changeUsername(String uid, BuildContext context) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'premiumUser': true,
        'upgradedAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      AuthErrorDialog.showErrorDialog(
        context,
        e.message ?? "Error upgrading user.",
      );
    }
  }

  Future<String?> getName(String uid, BuildContext context) async {
    try {
      var docSnapshot = await _firestore.collection('users').doc(uid).get();
      if (docSnapshot.exists) {
        var name = docSnapshot.data()?['name'];
        return name;
      } else {
        return 'User';
      }
    } on FirebaseException catch (e) {
      AuthErrorDialog.showErrorDialog(
        context,
        e.message ?? "Error upgrading user.",
      );
    }
    return null;
  }

  Future<bool> checkUserStatus(String uid, BuildContext context) async {
    try {
      var docSnapshot = await _firestore.collection('users').doc(uid).get();
      if (docSnapshot.exists) {
        bool? data = docSnapshot.data()?['premiumUser'];
        if (data == null) {
          return true;
        } else {
          return data;
        }
      }
      return false;
    } on FirebaseException catch (e) {
      AuthErrorDialog.showErrorDialog(
        context,
        e.message ?? 'Error checking user status',
      );
      return false;
    }
  }
}
