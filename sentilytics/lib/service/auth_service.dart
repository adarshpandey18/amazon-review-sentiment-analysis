import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentilytics/widget/auth_error_dialog.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up
  Future<UserCredential?> signUpWithEmail(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      AuthErrorDialog.showErrorDialog(
        context,
        e.message ?? "An unknown error occurred.",
      );
      return null;
    }
  }

  // Sign In
  Future<UserCredential?> signInWithEmail(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      AuthErrorDialog.showErrorDialog(
        context,
        e.message ?? "An unknown error occurred.",
      );
      return null;
    }
  }

  // Forgot Password
  Future<void> forgotPasswordEmail(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      AuthErrorDialog.showErrorDialog(
        context,
        e.message ?? "An unknown error occurred.",
      );
    }
  }
}
