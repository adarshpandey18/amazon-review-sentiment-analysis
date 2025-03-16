import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/provider/db_provider.dart';
import 'package:sentilytics/widget/get_premium_button.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DbProvider>(context);
    return FutureBuilder(
      future: dbProvider.checkUserStatus(
        FirebaseAuth.instance.currentUser!.uid,
        context,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator());
        }
        if (snapshot.hasError) {
          return Icon(Icons.error);
        }
        bool isPremium = snapshot.data ?? false;

        return isPremium
            ? Center(child: Text('History'))
            : Center(
              child: GetPremiumButton(
                onTap: () {
                  dbProvider.upgradeUserToPremium(
                    FirebaseAuth.instance.currentUser!.uid,
                    context,
                  );
                },
              ),
            );
      },
    );
  }
}
