import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CalculatorPractice extends StatefulWidget {
  const CalculatorPractice({super.key});

  @override
  State<CalculatorPractice> createState() => _CalculatorPracticeState();
}

class _CalculatorPracticeState extends State<CalculatorPractice> {
  final calculatorField = TextEditingController();
  List calculatorBtns = [
    "C",
    "%",
    "<=",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    ";",
    "0",
    ".",
    "=",
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: theme.colorScheme.onSurface,
              ),
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: calculatorField,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "0",
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.colorScheme.onSurface,
                      )),
                  textDirection: TextDirection.rtl,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "1050",
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          const Divider(),
          const Gap(10),
          GridView.builder(
            itemCount: calculatorBtns.length,
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 50,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                var val = calculatorField.text;
                calculatorField.text = val + calculatorBtns[index];
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: theme.colorScheme.primaryContainer,
                ),
                child: Text(
                  calculatorBtns[index],
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    calculatorField.dispose();
  }

  void clear() {
    calculatorField.clear();
  }
}
