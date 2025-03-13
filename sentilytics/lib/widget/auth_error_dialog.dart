import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthErrorDialog {

  AuthErrorDialog._();
   // Show Error Dialog
  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder:
          (context) => CupertinoAlertDialog(
            title: Text("Authentication Error"),
            content: Text(message),
            actions: [
              CupertinoButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

            ],
            
          ),
    );
  }
}

