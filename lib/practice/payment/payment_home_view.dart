import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentHomeView extends StatefulWidget {
  const PaymentHomeView({super.key});

  @override
  State<PaymentHomeView> createState() => _PaymentHomeViewState();
}

class _PaymentHomeViewState extends State<PaymentHomeView> {
  late Razorpay _razorpay;
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log("Payment succes");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log("Payment error");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log("Wallet");
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            var options = {
              'key': 'rzp_test_GcZZFDPP0jHtC4',
              'amount': 1000,
              'name': 'Testing.',
              'description': 'testingpurpose',
              'prefill': {'contact': '8137021939', 'email': 'test@razorpay.com'}
            };

            _razorpay.open(options);
          },
          child: const Text("Payment"),
        ),
      ),
    );
  }
}
