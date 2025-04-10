import 'package:flutter/material.dart';
import 'package:sentilytics/service/payment_service.dart';

class PaymentProvider extends ChangeNotifier {
  final PaymentService paymentService = PaymentService();

  void handlePaymentErrorResponse(BuildContext context) {
    paymentService.handlePaymentErrorResponse(context);
  }

  void handlePaymentSuccess(String uid, BuildContext context) async {
    paymentService.handlePaymentSuccess(uid, context);
  }

  void handleExternalWalletSelected(BuildContext context) {
    paymentService.handleExternalWalletSelected(context);
  }
}
