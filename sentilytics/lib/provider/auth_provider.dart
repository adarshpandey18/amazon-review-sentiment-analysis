import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sentilytics/service/auth_service.dart';

class AppAuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  // Sign In User With Email
  Future<UserCredential?> signInWithEmail(
    String email,
    String password,
    BuildContext context,
  ) async {
    final userCredential = await _authService.signInWithEmail(
      email,
      password,
      context,
    );
    return userCredential;
  }

  // Sign Up User With Email
  Future<UserCredential?> signUpWithEmail(
    String email,
    String password,
    BuildContext context,
  ) async {
    final userCredential = await _authService.signUpWithEmail(
      email,
      password,
      context,
    );
    notifyListeners();
    return userCredential;
  }

  // Send Forgot Password Email
  Future<void> forgotPasswordEmail(String email, BuildContext context) async {
    await _authService.forgotPasswordEmail(email, context);
    notifyListeners();
  }
}
