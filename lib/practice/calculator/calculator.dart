import 'dart:ui';

import 'package:flutter/material.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _output = "0";
  String _result = "0";
  String _operator = "";
  double num1 = 0.0;
  double num2 = 0.0;

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      _operator = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(_output);
      _operator = buttonText;
      _output = "0";
    } else if (buttonText == "=") {
      num2 = double.parse(_output);

      if (_operator == "+") {
        _result = (num1 + num2).toString();
      } else if (_operator == "-") {
        _result = (num1 - num2).toString();
      } else if (_operator == "*") {
        _result = (num1 * num2).toString();
      } else if (_operator == "/") {
        _result = (num1 / num2).toString();
      }

      _output = _result;
      _operator = "";
    } else {
      _output += buttonText;
    }

    setState(() {
      _output = double.parse(_output).toString();
    });
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              _output,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("/"),
                ],
              ),
              Row(
                children: [
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("*"),
                ],
              ),
              Row(
                children: [
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-"),
                ],
              ),
              Row(
                children: [
                  _buildButton("."),
                  _buildButton("0"),
                  _buildButton("00"),
                  _buildButton("+"),
                ],
              ),
              Row(
                children: [
                  _buildButton("C"),
                  _buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
