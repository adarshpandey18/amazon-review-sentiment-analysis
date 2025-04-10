import 'package:flutter/material.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/core/utils/helper_functions.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed:
                      () => HelperFunctions.launchUrlLink(
                        TextString.aboutPhoneNumber,
                        context,
                      ),
                  icon: Icon(Icons.call),
                ),
                IconButton(
                  onPressed:
                      () => HelperFunctions.launchUrlLink(
                        TextString.aboutEmailId,
                        context,
                      ),
                  icon: Icon(Icons.email),
                ),
                IconButton(
                  onPressed:
                      () => HelperFunctions.launchUrlLink(
                        TextString.whatsappChat,
                        context,
                      ),
                  icon: Icon(Icons.chat),
                ),  
              ],
            ),
          ],
        ),
      ),
    );
  }
}
