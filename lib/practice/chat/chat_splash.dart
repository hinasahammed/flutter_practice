import 'package:flutter/material.dart';

class ChatSplash extends StatelessWidget {
  const ChatSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
