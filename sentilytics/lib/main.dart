import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/core/theme/app_theme.dart';
import 'package:sentilytics/firebase_options.dart';
import 'package:sentilytics/provider/auth_provider.dart';
import 'package:sentilytics/provider/db_provider.dart';
import 'package:sentilytics/routes/app_routes_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppAuthProvider()),
        ChangeNotifierProvider(create: (context) => DbProvider()),
      ],
      child: MaterialApp.router(
        
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkAppTheme,
        theme: AppTheme.lightAppTheme,
        routerConfig: AppRoutesConfig.goRouter,
        title: TextString.appName,
      ),
    );
  }
}
