import 'package:blur/blur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/provider/db_provider.dart';
import 'package:sentilytics/widget/double_text_heading.dart';
import 'package:sentilytics/widget/get_premium_card.dart';

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

        return Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      DoubleTextHeading(
                        firstText: TextString.historyFirstText,
                        secondText: TextString.historySecondText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (!isPremium)
              Positioned.fill(
                child: Blur(
                  blur: 3,
                  blurColor: Theme.of(context).secondaryHeaderColor,
                  child: Center(child: Text('Upgrade to Premium')),
                ),
              ),
            if (!isPremium)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: GetPremiumCard(),
                ),
              ),
          ],
        );
      },
    );
  }
}
