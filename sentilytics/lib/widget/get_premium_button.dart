import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/provider/payment_provider.dart';

class GetPremiumButton extends StatefulWidget {
  const GetPremiumButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<GetPremiumButton> createState() => _GetPremiumButtonState();
}

class _GetPremiumButtonState extends State<GetPremiumButton> {
  late Razorpay _razorpay;
  var options;
  @override
  void initState() {
    super.initState();

    options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 1000,
      'name': TextString.appName,
      'description': TextString.appDescription,
      'prefill': {
        'contact': TextString.aboutPhoneNumber,
        'email': TextString.aboutEmailId,
      },
    };

    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (
      PaymentSuccessResponse response,
    ) {
      final paymentProvider = Provider.of<PaymentProvider>(
        context,
        listen: false,
      );
      paymentProvider.handlePaymentSuccess(response.paymentId ?? '', context);
    });

    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (
      PaymentFailureResponse response,
    ) {
      final paymentProvider = Provider.of<PaymentProvider>(
        context,
        listen: false,
      );
      paymentProvider.handlePaymentErrorResponse(context);
    });

    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, (
      ExternalWalletResponse response,
    ) {
      final paymentProvider = Provider.of<PaymentProvider>(
        context,
        listen: false,
      );
      paymentProvider.handleExternalWalletSelected(context);
    });
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        Icons.workspace_premium_rounded,
        color: Theme.of(context).colorScheme.secondary,
      ),
      label: Text('Get Premium'),
      onPressed: () {
        _razorpay.open(options);
      },
    );
  }
}
