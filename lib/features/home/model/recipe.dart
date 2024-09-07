import 'package:cloud_firestore/cloud_firestore.dart';

import 'recipe_types.dart';

class Recipe {
  final String title;
  final int servings;
  int? readyInMinutes;
  final List<String> ingreadiants;
  final List<String> instructions;
  final RecipeTypes? type;
  final String? impPath;
  bool isFav = false;
  factory Recipe.fromFirestore(DocumentSnapshot<Map<String, dynamic>> recipe) {
    final data = recipe.data();
    return Recipe(
      title: data?['title'] ?? '',
      readyInMinutes: data?['time'] ?? 0,
      servings: data?['servings'] ?? 1,
      ingreadiants: List<String>.from(data?['ingredients'] ?? []),
      instructions: List<String>.from(data?['instructions'] ?? []),
      impPath: data?['imagePath'] ?? '',
      type: RecipeTypes.values.firstWhere((e) => e.name == data?['type']),
      isFav: data?['isFav'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'title': title,
        'time': readyInMinutes,
        'servings': servings,
        'ingredients': ingreadiants,
        'instructions': instructions,
        'imagePath': impPath,
        'type': type?.name,
        'isFav': isFav,
      };

  Recipe({
    required this.title,
    required this.ingreadiants,
    required this.instructions,
    required this.type,
    required this.impPath,
    this.readyInMinutes = 5,
    this.isFav = false,
    this.servings = 1,
  });
}
