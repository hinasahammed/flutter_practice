import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddMultiplelist extends StatefulWidget {
  const AddMultiplelist({super.key});

  @override
  State<AddMultiplelist> createState() => _AddMultiplelistState();
}

class _AddMultiplelistState extends State<AddMultiplelist> {
  List instruction = [];
  final instController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: instController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Instruction"),
                )),
                const Gap(10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      instruction.add(instController.text);
                    });
                    instController.clear();
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
            const Gap(10),
            Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                itemCount: instruction.length,
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Text(
                        instruction[index],
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              instruction.remove(instruction[index]);
                            });
                          },
                          icon: Icon(
                            Icons.close,
                            color: theme.colorScheme.onPrimary,
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
