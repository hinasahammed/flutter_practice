import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerExample extends StatelessWidget {
  const OpenContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Container Animation'),
      ),
      body: Center(
        child: OpenContainer(
          transitionDuration: const Duration(milliseconds: 500),
          openBuilder: (context, _) => const DetailsScreen(),
          closedBuilder: (context, openContainer) => GestureDetector(
            onTap: openContainer,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Tap to Open',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: const Center(
        child: Text('This is the details screen!'),
      ),
    );
  }
}
