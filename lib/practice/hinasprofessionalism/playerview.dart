import 'package:flutter/material.dart';

class Playerview extends StatefulWidget {
  const Playerview({super.key});

  @override
  State<Playerview> createState() => _PlayerviewState();
}

class _PlayerviewState extends State<Playerview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is Player"),
      ),
    );
  }
}
