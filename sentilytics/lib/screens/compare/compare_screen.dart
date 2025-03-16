import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/provider/db_provider.dart';
import 'package:sentilytics/widget/get_premium_button.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

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
          return Icon(Icons.error); // Error handling
        }
        bool isPremium = snapshot.data ?? false;

        return isPremium
            ? Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TextString.compareFirstText,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      TextString.compareSecondText,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            )
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
