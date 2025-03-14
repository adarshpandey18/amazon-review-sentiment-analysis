import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sentilytics/service/auth_service.dart';
import 'package:sentilytics/service/database_service.dart';

class AppAuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final DatabaseService _dbService = DatabaseService();
  bool isLoading = false;

  // Sign In User With Email
  Future<UserCredential?> signInWithEmail(
    String email,
    String password,
    BuildContext context,
  ) async {
    isLoading = true;
    notifyListeners();
    final userCredential = await _authService.signInWithEmail(
      email,
      password,
      context,
    );

    isLoading = false;
    notifyListeners();
    return userCredential;
  }

  // Sign Up User With Email
  Future<UserCredential?> signUpWithEmail(
    String name,
    String email,
    String password,
    BuildContext context,
  ) async {
    isLoading = true;
    notifyListeners();
    final userCredential = await _authService.signUpWithEmail(
      email,
      password,
      context,
    );

    await _dbService.saveUserData(
      userCredential!.user!.uid,
      name,
      email,
      false,
      context,
    );

    isLoading = false;
    notifyListeners();
    return userCredential;
  }

  // Send Forgot Password Email
  Future<void> forgotPasswordEmail(String email, BuildContext context) async {
    await _authService.forgotPasswordEmail(email, context);

    notifyListeners();
  }

  // Sign Out
  Future<void> signOut(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    await _authService.signOut(context);
    isLoading = false;
    notifyListeners();
  }
}
