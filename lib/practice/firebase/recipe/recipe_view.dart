import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_practice/practice/firebase/recipe/add_task_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_practice/practice/firebase/recipe/recipe_details.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

class RecipeView extends StatefulWidget {
  const RecipeView({super.key});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  Map<String, Uint8List?> recipeImages = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Recipes").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData ||
                snapshot.data == null ||
                snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("No recipe found!"),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return ListView.separated(
                itemCount: snapshot.data!.docs.length,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index];
                  final recipeName = data['recipeName'] ?? '';
                  if (!recipeImages.containsKey(recipeName)) {
                    fetch(recipeName).then((imageData) {
                      setState(() {
                        recipeImages[recipeName] = imageData;
                      });
                    });
                  }
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetails(
                              id: data.id,
                              image: recipeImages[recipeName],
                            ),
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: recipeImages[recipeName] != null
                              ? MemoryImage(recipeImages[recipeName]!)
                              : const NetworkImage(
                                  "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),
                          fit: BoxFit.cover,
                          opacity: .5,
                        ),
                      ),
                      child: Text(
                        data['recipeName'] ?? '',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            useSafeArea: true,
            isScrollControlled: true,
            builder: (context) => SizedBox(
              height: size.height,
              child: const AddTaskSheet(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<Uint8List?> fetch(String recipeName) async {
    try {
      final response = await http.post(
        Uri.parse("https://text-to-image13.p.rapidapi.com/"),
        headers: {
          "Content-Type": "application/json",
          "x-rapidapi-host": "text-to-image13.p.rapidapi.com",
          "x-rapidapi-key":
              "b65e9e1178msh7661c663c46802cp15188djsnc3290d348d6c",
        },
        body: jsonEncode({"prompt": recipeName}),
      );

      if (response.statusCode == 200) {
        return response.bodyBytes; // Return the image data as bytes
      } else {
        log("Failed to fetch image: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log("Error fetching image: $e");
      return null;
    }
  }
}
