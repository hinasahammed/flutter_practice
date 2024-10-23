import 'package:flutter/material.dart';
import 'package:flutter_practice/practice/hinasprofessionalism/player.dart';
import 'package:flutter_practice/practice/hinasprofessionalism/turf.dart';

class TwoAuth extends StatefulWidget {
  const TwoAuth({super.key});

  @override
  State<TwoAuth> createState() => _TwoAuthState();
}

class _TwoAuthState extends State<TwoAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Player(),
                      ));
                },
                child: const Text("Continue with player")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Turf(),
                      ));
                },
                child: const Text("Continue with turf")),
          ],
        ),
      ),
    );
  }
}
