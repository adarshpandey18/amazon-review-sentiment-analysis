import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/provider/payment_provider.dart';

class GetPremiumCard extends StatefulWidget {
  final VoidCallback onTap;

  const GetPremiumCard({super.key, required this.onTap});

  @override
  State<GetPremiumCard> createState() => _GetPremiumCardState();
}

class _GetPremiumCardState extends State<GetPremiumCard> {
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Get Premium",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Unlock exclusive features like product comparison and search history.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _razorpay.open(options);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade800,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Get Premium",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
