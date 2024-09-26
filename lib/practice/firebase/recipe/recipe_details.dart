import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key, required this.id, required this.image});
  final String id;
  final Uint8List? image;

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            widget.image != null
                ? Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: MemoryImage(widget.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const CircularProgressIndicator(),
            const Gap(10),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Recipes")
                  .doc(widget.id)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData ||
                    snapshot.data?.data() == null ||
                    snapshot.data!.data()!.isEmpty) {
                  return const Center(
                    child: Text("No recipe found"),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  final data = snapshot.data!.data()!;
                  final instructions = List.from(data['instructions']);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['recipeName'],
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const Gap(20),
                      Text(
                        "Ingredients",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const Gap(20),
                      ListView.builder(
                        itemCount: data['ingredients'].length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final ingredients = data['ingredients'][index];
                          return Card(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                ingredients,
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          );
                        },
                      ),
                      const Gap(20),
                      Text(
                        "Instructions",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const Gap(20),
                      Stepper(
                        key: ValueKey(instructions.length),
                        onStepTapped: (index) {
                          setState(() {
                            currentStep = index;
                          });
                        },
                        onStepContinue: () {
                          if (currentStep < instructions.length - 1) {
                            setState(() {
                              currentStep += 1;
                            });
                          }
                        },
                        onStepCancel: () {
                          if (currentStep > 0) {
                            setState(() {
                              currentStep -= 1;
                            });
                          }
                        },
                        currentStep: currentStep,
                        steps: instructions
                            .asMap()
                            .map(
                              (index, ingredient) => MapEntry(
                                index,
                                Step(
                                  isActive: currentStep == index ? true : false,
                                  title: Text("Step ${index + 1}"),
                                  content: Text(ingredient),
                                ),
                              ),
                            )
                            .values
                            .toList(),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
