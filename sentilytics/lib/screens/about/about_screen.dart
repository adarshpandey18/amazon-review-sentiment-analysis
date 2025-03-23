import 'package:flutter/material.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TextString.profileAboutText)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageString.logoPath,
              width: 150,
              height: 150,
              filterQuality: FilterQuality.high,
            ),
            Text(
              TextString.appName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 13),
            Text(
              TextString.appDescription,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 13),
            Row(children: [Icon(Icons.call), Icon(Icons.email)]),
          ],
        ),
      ),
    );
  }
}
