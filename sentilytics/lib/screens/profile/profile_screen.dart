import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/provider/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AppAuthProvider>(context);

    return Center(
      child: ElevatedButton(
        onPressed: () {
          authProvider.signOut(context);
        },
        child: Text('Sign Out'),
      ),
    );
  }
}
