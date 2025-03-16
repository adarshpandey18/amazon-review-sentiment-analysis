import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/provider/db_provider.dart';
import 'package:sentilytics/widget/get_premium_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _dbProvider = Provider.of<DbProvider>(context);
    return FutureBuilder(
      future: _dbProvider.checkUserStatus(
        FirebaseAuth.instance.currentUser!.uid,
        context,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator());
        }
        if (snapshot.hasError) {
          return Icon(Icons.error); // Error handling
        }
        bool isPremium = snapshot.data ?? false;

        return isPremium
            ? Center(child: Text('Compare'))
            : Center(
              child: GetPremiumButton(
                onTap: () {
                  _dbProvider.upgradeUserToPremium(
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
