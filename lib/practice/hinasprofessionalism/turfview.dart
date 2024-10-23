import 'package:flutter/material.dart';

class TurfView extends StatefulWidget {
  const TurfView({super.key});

  @override
  State<TurfView> createState() => _TurfViewState();
}

class _TurfViewState extends State<TurfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is Turf"),
      ),
    );
  }
}
