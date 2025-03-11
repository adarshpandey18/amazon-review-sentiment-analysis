import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sentilytics/routes/app_router_constant.dart';
import 'package:sentilytics/screens/authentication/forgot%20password/forgot_password_screen.dart';
import 'package:sentilytics/screens/authentication/sign%20in/sign_in_screen.dart';
import 'package:sentilytics/screens/authentication/sign%20up/sign_up_screen.dart';

class AppRoutesConfig {
  static final GoRouter goRouter = GoRouter(
    initialLocation: AppRouterConstant.signInRoutePath,
    errorBuilder: (context, state) => Text('Hello'),
    routes: [
      GoRoute(
        path: AppRouterConstant.signInRoutePath,
        name: AppRouterConstant.signInRouteName,
        builder: (context, state) => SignInScreen(),
        routes: [
          GoRoute(
            path: AppRouterConstant.forgotPasswordRoutePath,
            name: AppRouterConstant.forgotPasswordRouteName,
            builder: (context, state) => ForgotPasswordScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRouterConstant.signUpRoutePath,
        name: AppRouterConstant.signUpRouteName,
        builder: (context, state) => SignUpScreen(),
      ),
    ],
  );
}
