import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/model/firebase/recipe_model.dart';
import 'package:gap/gap.dart';

class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final recipeController = TextEditingController();
  final ingredientsController = TextEditingController();
  final instructionController = TextEditingController();
  List ingredients = [];
  List instructions = [];
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add recipe",
            style: theme.textTheme.titleLarge!
                .copyWith(color: theme.colorScheme.onSurface),
          ),
          const Gap(20),
          TextFormField(
            controller: recipeController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Recipe name",
            ),
          ),
          const Gap(10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: ingredientsController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Ingredients",
                  ),
                ),
              ),
              const Gap(10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ingredients.add(ingredientsController.text);
                  });
                  ingredientsController.clear();
                },
                child: const Text("Add"),
              ),
            ],
          ),
          const Gap(10),
          Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.onSurface),
              borderRadius: BorderRadius.circular(15),
            ),
            child: GridView.builder(
              itemCount: ingredients.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350,
                mainAxisExtent: 80,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "${index + 1}. ${ingredients[index]}",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              ingredients.remove(ingredients[index]);
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
            ),
          ),
          const Gap(10),
          Text(
            "Add instruction steps",
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: instructionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Instructions",
                  ),
                ),
              ),
              const Gap(10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    instructions.add(instructionController.text);
                  });
                  instructionController.clear();
                },
                child: const Text("Add"),
              )
            ],
          ),
          const Gap(10),
          if (instructions.isNotEmpty)
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
                  .map(
                    (e) => Step(
                      isActive:
                          currentStep == instructions.indexOf(e) ? true : false,
                      title: Text("Step ${instructions.indexOf(e) + 1}"),
                      content: Text(e),
                    ),
                  )
                  .toList(),
            ),
          const Gap(20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                addRecipe(context);
              },
              child: const Text("Add Recipe"),
            ),
          ),
        ],
      ),
    );
  }

  Future addRecipe(BuildContext context) async {
    final firestore = FirebaseFirestore.instance;

    try {
      await firestore
          .collection("Recipes")
          .doc()
          .set(RecipeModel(
            recipeName: recipeController.text,
            ingredients: ingredients,
            instructions: instructions,
          ).toMap())
          .then(
        (value) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Added successfully"),
              ),
            );
          }
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
