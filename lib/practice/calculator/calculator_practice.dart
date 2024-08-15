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
    "00",
    "0",
    ".",
    "=",
  ];

  String lastOperator = '';
  double allAnswer = 0.0;

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
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(.5),
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "0",
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: theme.textTheme.titleLarge!.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(.5),
                      )),
                  textDirection: TextDirection.rtl,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    allAnswer.toString(),
                    style: theme.textTheme.headlineSmall!.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
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
                switch (calculatorBtns[index]) {
                  case "+":
                    operaion(calculatorBtns[index]);
                    break;
                  case "-":
                    operaion(calculatorBtns[index]);
                    break;
                  case "*":
                    operaion(calculatorBtns[index]);
                    break;
                  case "/":
                    operaion(calculatorBtns[index]);
                    break;
                  case "=":
                    equalOperation();
                    break;
                  case "C":
                    clear();
                    break;
                  case "<=":
                    clearOneValue();
                    break;
                  default:
                    addValues(calculatorBtns[index]);
                }
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
    setState(() {
      allAnswer = 0;
    });
  }

  void addValues(String userVal) {
    var val = calculatorField.text;
    calculatorField.text = val + userVal;
  }

  void clearOneValue() {
    var currentValue = calculatorField.text;
    if (currentValue.isNotEmpty) {
      calculatorField.text = currentValue.substring(0, currentValue.length - 1);
    }
  }

  void operaion(String val) {
    if (calculatorField.text.isNotEmpty) {
      switch (val) {
        case "+":
          setState(() {
            allAnswer += int.parse(calculatorField.text);
            lastOperator = val;
          });
          break;
        case "-":
          setState(() {
            allAnswer -= int.parse(calculatorField.text);
            lastOperator = val;
          });
          break;
        case "*":
          setState(() {
            allAnswer *= int.parse(calculatorField.text);
            print(allAnswer);
            lastOperator = val;
          });
          break;
        case "/":
          setState(() {
            allAnswer /= int.parse(calculatorField.text);
            lastOperator = val;
          });
          break;
        default:
      }
      calculatorField.clear();
    }
  }

  void equalOperation() {
    switch (lastOperator) {
      case "+":
        setState(() {
          allAnswer += int.parse(calculatorField.text);
          calculatorField.clear();
        });
        break;
      case "-":
        setState(() {
          allAnswer -= int.parse(calculatorField.text);
          calculatorField.clear();
        });
        break;
      case "*":
        setState(() {
          allAnswer *= int.parse(calculatorField.text);
          calculatorField.clear();
        });
        break;
      case "/":
        setState(() {
          allAnswer /= int.parse(calculatorField.text);
          calculatorField.clear();
        });
        break;
      default:
    }
  }
}
