import 'package:flutter/material.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:share_plus/share_plus.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  static launchLink(String url, BuildContext context) async {
    try {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        launchUrl(uri);
      } else {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(message: TextString.urlLaunchErrorMessage),
        );
      }
    } catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: 'An error occurred'),
      );
    }
  }

  static shareApp(BuildContext context) async {
    try {
      final result = await Share.shareXFiles(
        [XFile(ImageString.logoPath)],
        text: TextString.appDescription,
        subject: TextString.appName,
      );
      if (result.status == ShareResultStatus.dismissed) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(message: 'Did you not like the app ?'),
        );
      } else if (result.status == ShareResultStatus.success) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(message: 'Thanks for sharing'),
        );
      } else {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(message: 'An error occurred'),
        );
      }
    } catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: 'An error occurred'),
      );
    }
  }
}
