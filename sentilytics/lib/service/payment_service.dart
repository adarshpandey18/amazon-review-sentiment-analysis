import 'package:flutter/material.dart';
import 'package:sentilytics/service/database_service.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class PaymentService {
  final DatabaseService databaseService = DatabaseService();
  void handlePaymentErrorResponse(String uid, BuildContext context) async {
    await databaseService.upgradeUserToPremium(uid, context);
    _showSnackbar(context, CustomSnackBar.error(message: 'Payment Failed!'));
  }

  void handlePaymentSuccess(String uid, BuildContext context) async {
    await databaseService.upgradeUserToPremium(uid, context);
    _showSnackbar(
      context,
      CustomSnackBar.success(message: 'Payment Successful'),
    );
  }

  void handleExternalWalletSelected(BuildContext context) {
    _showSnackbar(
      context,
      CustomSnackBar.info(message: 'External Wallet Selected!'),
    );
  }

  static void _showSnackbar(BuildContext context, Widget snackBar) {
    final overlay = Overlay.of(context);
    showTopSnackBar(overlay, snackBar);
  }
}
