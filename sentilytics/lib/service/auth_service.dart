import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/routes/app_router_constant.dart';
import 'package:sentilytics/widget/auth_error_dialog.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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

      if (context.mounted) {
        context.go(AppRouterConstant.bottomAppBarRoutePath);
      } else {
        debugPrint('Context is not mounted, cannot navigate.');
      }

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

      if (context.mounted) {
        context.go(AppRouterConstant.bottomAppBarRoutePath);
      } else {
        debugPrint('Context is not mounted, cannot navigate.');
      }

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
      if (context.mounted) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.info(
            message: TextString.forgotPasswordSnackbarText,
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        );
      } else {
        debugPrint('Context is not mounted, cannot show snackbar.');
      }
    } on FirebaseAuthException catch (e) {
      AuthErrorDialog.showErrorDialog(
        context,
        e.message ?? "An unknown error occurred.",
      );
    }
  }

  // Sign Out
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      AuthErrorDialog.showErrorDialog(
        context,
        e.message ?? "An unknown error occurred.",
      );
    }
  }
}
