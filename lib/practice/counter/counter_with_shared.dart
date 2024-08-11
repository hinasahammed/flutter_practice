import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterWithShared extends StatefulWidget {
  const CounterWithShared({super.key});

  @override
  State<CounterWithShared> createState() => _CounterWithSharedState();
}

class _CounterWithSharedState extends State<CounterWithShared> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder(
              future: getCountVal(),
              builder: (context, snapshot) => Text(
                snapshot.data.toString(),
                style: theme.textTheme.headlineLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final pref = await SharedPreferences.getInstance();
          var val = pref.getInt("counterValue");
          setState(() {
            pref.setInt("counterValue", val = val! + 1);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<int> getCountVal() async {
    final pref = await SharedPreferences.getInstance();
    var val = pref.getInt("counterValue");
    return val ?? 0;
  }
}
