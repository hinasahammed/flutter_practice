import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeThroughExample extends StatefulWidget {
  const FadeThroughExample({super.key});

  @override
  State<FadeThroughExample> createState() => _FadeThroughExampleState();
}

class _FadeThroughExampleState extends State<FadeThroughExample> {
  bool _showFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade Through Animation'),
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (
          Widget child,
          Animation<double> primaryAnimation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _showFirstPage ? const FirstPage() : const SecondPage(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showFirstPage = !_showFirstPage;
          });
        },
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        height: 200,
        width: 200,
        child: const Center(
          child: Text(
            'First Page',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        height: 200,
        width: 200,
        child: const Center(
          child: Text(
            'Second Page',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
