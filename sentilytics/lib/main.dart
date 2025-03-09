  import 'package:flutter/material.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/core/theme/app_theme.dart';
import 'package:sentilytics/screens/authentication/sign%20in/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkAppTheme,
      theme: AppTheme.lightAppTheme,

      title: TextString.appName,
      home: SignInScreen(),
    );
  }
}
