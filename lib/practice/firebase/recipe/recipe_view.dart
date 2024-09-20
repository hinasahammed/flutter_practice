import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/model/recipe_model.dart';
import 'package:gap/gap.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({super.key});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  final recipeController = TextEditingController();
  final ingredientsController = TextEditingController();
  final instructionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            TextFormField(
              controller: ingredientsController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ingredients",
              ),
            ),
            const Gap(10),
            TextFormField(
              controller: instructionController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Instructions",
              ),
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
                  ingredients: ingredientsController.text,
                  instructions: instructionController.text)
              .toMap())
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
      print(e.toString());
    }
  }
}
