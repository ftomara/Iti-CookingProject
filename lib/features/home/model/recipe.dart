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
  String? imageUrl;
  set setUrl(String url) {
    imageUrl = url;
  }

  bool isFav = false;
  factory Recipe.fromFirestore(DocumentSnapshot<Map<String, dynamic>> recipe) {
    final data = recipe.data();
    print("Received data: $data");

    return Recipe(
      title: data?['title'] ?? '',
      readyInMinutes: data?['time'] ?? 0,
      servings: data?['servings'] ?? 1,
      ingreadiants: data?['ingredients'] != null
          ? List<String>.from(data?['ingredients'] as List)
          : [],
      instructions: data?['instructions'] != null
          ? List<String>.from(data?['instructions'] as List)
          : [],
      impPath: data?['imagePath'] ?? '',
      type: RecipeTypes.values.firstWhere((e) => e.name == data?['type'],
          orElse: () => RecipeTypes.breakfast // Handle invalid or missing type
          ),
      isFav: data?['isFav'] ?? false,
      imageUrl: data?['imageUrl'],
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
        'imageUrl': imageUrl,
      };

  Recipe({
    required this.title,
    this.imageUrl,
    required this.ingreadiants,
    required this.instructions,
    required this.type,
    required this.impPath,
    this.readyInMinutes = 5,
    this.isFav = false,
    this.servings = 1,
  });
}
