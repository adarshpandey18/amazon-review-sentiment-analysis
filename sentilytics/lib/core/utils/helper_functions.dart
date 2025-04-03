import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:share_plus/share_plus.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HelperFunctions {
  static Future<void> shareApp(BuildContext context) async {
    try {
      final tempFile = await _getImageFileFromAssets(ImageString.logoPath);
      if (tempFile == null) {
        _showSnackbar(
          context,
          CustomSnackBar.error(message: 'Failed to load image'),
        );
        return;
      }

      final result = await Share.shareXFiles(
        [XFile(tempFile.path)],
        text: TextString.appDescription,
        subject: TextString.appName,
      );

      if (result.status == ShareResultStatus.success) {
        _showSnackbar(
          context,
          CustomSnackBar.success(message: 'Thanks for sharing!'),
        );
      } else if (result.status == ShareResultStatus.dismissed) {
        _showSnackbar(
          context,
          CustomSnackBar.info(message: 'Did you not like the app? '),
        );
      } else {
        _showSnackbar(
          context,
          CustomSnackBar.error(message: 'An error occurred while sharing'),
        );
      }
    } catch (e) {
      _showSnackbar(
        context,
        CustomSnackBar.error(message: 'Error: ${e.toString()}'),
      );
    }
  }

  static Future<File?> _getImageFileFromAssets(String assetPath) async {
    try {
      // Ensure asset path starts with "assets/"
      if (!assetPath.startsWith("assets/")) {
        debugPrint("Invalid asset path: $assetPath");
        return null;
      }

      final byteData = await rootBundle.load(assetPath);
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/shared_logo.png');

      await file.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
      return file;
    } catch (e) {
      debugPrint("Error loading asset: $e");
      return null;
    }
  }

  static void _showSnackbar(BuildContext context, Widget snackBar) {
    final overlay = Overlay.of(context);
    showTopSnackBar(overlay, snackBar);
  }
  
}
