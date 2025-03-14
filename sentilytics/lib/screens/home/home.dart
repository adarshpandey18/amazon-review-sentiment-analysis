import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/provider/db_provider.dart';
import 'package:sentilytics/widget/get_premimum_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<DbProvider>(
          context,
          listen: false,
        ).getName(user.uid, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DbProvider>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey,',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  dbProvider.userName, // This will now update dynamically
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            GetPremimumButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
