import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class DistanceTest extends StatefulWidget {
  const DistanceTest({super.key});

  @override
  State<DistanceTest> createState() => _DistanceTestState();
}

class _DistanceTestState extends State<DistanceTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          double distanceInMeters = Geolocator.distanceBetween(
              11.259456335771029,
              75.79057108024436,
              11.284139175378918,
              75.78316800020981);

          log(distanceInMeters.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
