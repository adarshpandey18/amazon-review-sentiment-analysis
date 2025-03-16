import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sentilytics/screens/authentication/sign%20in/sign_in_screen.dart';
import 'package:sentilytics/screens/bottom%20app%20bar/bottom_app_bar_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (snapshot.hasData) {
          return const BottomAppBarScreen();
        } else {
          return const SignInScreen();
        }
      },
    );
  }
}
