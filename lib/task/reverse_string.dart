import 'package:flutter/material.dart';

class ReverseString extends StatefulWidget {
  const ReverseString({super.key});

  @override
  State<ReverseString> createState() => _ReverseStringState();
}

class _ReverseStringState extends State<ReverseString> {
  final stringcontroller = TextEditingController();

  String user = '';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reverse"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: stringcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Your String",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Here is your reversed String",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            Text(
              user,
              style: theme.textTheme.headlineLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  var reversed = reverseString();
                  setState(() {
                    user = reversed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                ),
                child: Text(
                  "Reverse",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String reverseString() {
    var userVal = stringcontroller.text;
    var reversed = userVal.split('').reversed.join('');
    return reversed;
  }
}
