import 'package:flutter/material.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TextString.profileHelpText)),
      body: Column(
        children: [
          Image.asset(ImageString.logoPath, width: 150, height: 150),
          Text('Sorry i can\'t help even i need help'),
        ],
      ),
    );
  }
}
