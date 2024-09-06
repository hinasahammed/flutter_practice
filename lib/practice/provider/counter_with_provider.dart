import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterWithProvider extends StatelessWidget {
  const CounterWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: Consumer<CounterProvider>(
          builder: (context, value, child) => Text(
            value.counterValue.toString(),
            style: theme.textTheme.headlineLarge!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterProvider extends ChangeNotifier {
  int _counterValue = 0;

  int get counterValue => _counterValue;

  void increment() {
    _counterValue++;
    notifyListeners();
  }
}
