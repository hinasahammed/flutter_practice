import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FormPractice extends StatelessWidget {
  const FormPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const DropdownMenu(dropdownMenuEntries: [
              DropdownMenuEntry(value: "One", label: "One"),
              DropdownMenuEntry(value: "Two", label: "Two"),
              DropdownMenuEntry(value: "Three", label: "Three"),
              DropdownMenuEntry(value: "Four", label: "Four"),
            ]),
            const Gap(10),
            RadioListTile(
              value: "Male",
              groupValue: "MAle",
              onChanged: (value) {},
            ),
            Radio(
              value: "Male",
              groupValue: "Male",
              onChanged: (value) {},
            ),
            const Gap(20),
            Checkbox(
              value: true,
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
