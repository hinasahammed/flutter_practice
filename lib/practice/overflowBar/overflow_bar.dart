import 'package:flutter/material.dart';

class OverflowBarWidget extends StatelessWidget {
  const OverflowBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overflow"),
      ),
      body: Column(
        children: [
          OverflowBar(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tight(
                  const Size.square(300),
                ),
                child: Container(
                  color: Colors.grey,
                ),
              ),
              ConstrainedBox(
                  constraints: BoxConstraints.loose(
                    const Size.fromWidth(300),
                  ),
                  child: const Column(
                    children: [
                      Text("data"),
                      Text("data"),
                      Text("kdjfsghkjf kfgud hg jgh kjghj"),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
