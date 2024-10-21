import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpiPaymentPage extends StatefulWidget {
  const UpiPaymentPage({super.key});

  @override
  State<UpiPaymentPage> createState() => _UpiPaymentPageState();
}

class _UpiPaymentPageState extends State<UpiPaymentPage> {
  final String upiId = 'diyashajith.2231@okaxis';
  // Replace with UPI ID
  final String name = 'Diya Shajith';
  // Replace with name
  final String amount = '1';
  // Replace with the amount
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UPI Payment')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            sendPayment();
          },
          child: const Text('Pay with GPay'),
        ),
      ),
    );
  }

  void sendPayment() async {
    String upiurl =
        'upi://pay?pa=$upiId&pn=SenderName&tn=TestingGpay&am=100&cu=INR';
    launchUrl(Uri.parse(upiurl));
  }
}
