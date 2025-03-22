import 'package:go_router/go_router.dart';
import 'package:sentilytics/routes/app_router_constant.dart';
import 'package:sentilytics/screens/about/about_screen.dart';
import 'package:sentilytics/screens/authentication/auth_wrapper.dart';
import 'package:sentilytics/screens/authentication/forgot%20password/forgot_password_screen.dart';
import 'package:sentilytics/screens/authentication/sign%20in/sign_in_screen.dart';
import 'package:sentilytics/screens/authentication/sign%20up/sign_up_screen.dart';
import 'package:sentilytics/screens/bottom%20app%20bar/bottom_app_bar_screen.dart';
import 'package:sentilytics/screens/change%20password/change_password_screen.dart';
import 'package:sentilytics/screens/error/app_error_screen.dart';
import 'package:sentilytics/screens/help/help_screen.dart';

class AppRoutesConfig {
  static final GoRouter goRouter = GoRouter(
    initialLocation: AppRouterConstant.authWrapperRoutePath,
    errorBuilder: (context, state) => AppErrorScreen(),
    routes: [
      GoRoute(
        path: AppRouterConstant.authWrapperRoutePath,
        name: AppRouterConstant.authWrapperRoutePath,
        builder: (context, state) => AuthWrapper(),
      ),
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
      GoRoute(
        path: AppRouterConstant.bottomAppBarRoutePath,
        name: AppRouterConstant.bottomAppBarRouteName,
        builder: (context, state) => BottomAppBarScreen(),
      ),
      GoRoute(
        path: AppRouterConstant.aboutAppRoutePath,
        name: AppRouterConstant.aboutRouteName,
        builder: (context, state) => AboutScreen(),
      ),
      GoRoute(
        path: AppRouterConstant.helpRoutePath,
        name: AppRouterConstant.helpRouteName,
        builder: (context, state) => HelpScreen(),
      ),
      GoRoute(
        path: AppRouterConstant.changePasswordRoutePath,
        name: AppRouterConstant.changePasswordRouteName,
        builder: (context, state) => ChangePasswordScreen(),
      ),
    ],
  );
}
