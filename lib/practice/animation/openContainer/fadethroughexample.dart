import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeThroughExample extends StatefulWidget {
  const FadeThroughExample({super.key});

  @override
  _FadeThroughExampleState createState() => _FadeThroughExampleState();
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
        child: _showFirstPage ? _FirstPage() : _SecondPage(),
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

class _FirstPage extends StatelessWidget {
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

class _SecondPage extends StatelessWidget {
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
