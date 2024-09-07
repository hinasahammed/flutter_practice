import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveExample extends StatelessWidget {
  const RiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: RiveAnimation.asset(
              "assets/animation/vault_boy.riv",
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
