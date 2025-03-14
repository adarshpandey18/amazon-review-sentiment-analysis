import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sentilytics/routes/app_router_constant.dart';
import 'package:sentilytics/screens/authentication/forgot%20password/forgot_password_screen.dart';
import 'package:sentilytics/screens/authentication/sign%20in/sign_in_screen.dart';
import 'package:sentilytics/screens/authentication/sign%20up/sign_up_screen.dart';
import 'package:sentilytics/screens/error/app_error_screen.dart';
import 'package:sentilytics/screens/home/home.dart';

class AppRoutesConfig {
  static final GoRouter goRouter = GoRouter(
    initialLocation: AppRouterConstant.signInRoutePath,
    errorBuilder: (context, state) => const AppErrorScreen(),

    refreshListenable: GoRouterRefreshStream(
      FirebaseAuth.instance.authStateChanges(),
    ),

    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return AppRouterConstant.signInRoutePath;
      }
      return null;
    },

    routes: [
      GoRoute(
        path: AppRouterConstant.signInRoutePath,
        name: AppRouterConstant.signInRouteName,
        builder: (context, state) => const SignInScreen(),
        routes: [
          GoRoute(
            path: AppRouterConstant.forgotPasswordRoutePath,
            name: AppRouterConstant.forgotPasswordRouteName,
            builder: (context, state) => const ForgotPasswordScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRouterConstant.signUpRoutePath,
        name: AppRouterConstant.signUpRouteName,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRouterConstant.homeRoutePath,
        name: AppRouterConstant.homeRouteName,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}

// **Helper class to listen to auth state changes**
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<User?> stream) {
    stream.listen((_) => notifyListeners());
  }
}
