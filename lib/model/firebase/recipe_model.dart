import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class RecipeModel {
  final String recipeName;
  final List ingredients;
  final List instructions;

  RecipeModel({
    required this.recipeName,
    required this.ingredients,
    required this.instructions,
  });

  RecipeModel copyWith({
    String? recipeName,
    List? ingredients,
    List? instructions,
  }) {
    return RecipeModel(
      recipeName: recipeName ?? this.recipeName,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'recipeName': recipeName,
      'ingredients': ingredients,
      'instructions': instructions,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      recipeName: map['recipeName'] as String,
      ingredients: List.from((map['ingredients'] as List)),
      instructions: List.from((map['instructions'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) =>
      RecipeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RecipeModel(recipeName: $recipeName, ingredients: $ingredients, instructions: $instructions)';

  @override
  bool operator ==(covariant RecipeModel other) {
    if (identical(this, other)) return true;

    return other.recipeName == recipeName &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.instructions, instructions);
  }

  @override
  int get hashCode =>
      recipeName.hashCode ^ ingredients.hashCode ^ instructions.hashCode;
}
