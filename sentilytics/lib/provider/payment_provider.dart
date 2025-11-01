import 'package:flutter/material.dart';
import 'package:sentilytics/service/payment_service.dart';

class PaymentProvider extends ChangeNotifier {
  final PaymentService paymentService = PaymentService();

  void handlePaymentErrorResponse(String uid, BuildContext context) {
    paymentService.handlePaymentErrorResponse(uid, context);
  }

  void handlePaymentSuccess(String uid, BuildContext context) async {
    paymentService.handlePaymentSuccess(uid, context);
  }

  void handleExternalWalletSelected(BuildContext context) {
    paymentService.handleExternalWalletSelected(context);
  }
}
