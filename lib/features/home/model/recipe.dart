import 'package:cloud_firestore/cloud_firestore.dart';

import 'recipe_types.dart';

class Recipe {
  final String title;
  final int servings;
  final double calories;
  final List<String> ingreadiants;
  final List<String> instructions;
  final RecipeTypes type;
  final String impPath;
  bool isFav = false;
  factory Recipe.fromFirestore(DocumentSnapshot<Map<String, dynamic>> recipe) {
    final data = recipe.data();
    return Recipe(
      title: data?['title'] ?? '',
      // chef: data['chef'] ?? '',
      calories: data?['calories']?.toDouble() ?? 0.0,
      ingreadiants: List<String>.from(data?['ingredients'] ?? []),
      instructions: List<String>.from(data?['instructions'] ?? []),
      impPath: data?['imagePath'] ?? '',
      type: RecipeTypes.values.firstWhere((e) => e.toString() == data?['type']),
    );
  }

  Map<String, dynamic> toFirestore() =>
  {
   
      'title' : title,
      'calories' : calories,
      'ingredients' : ingreadiants,
      'instructions' : instructions,
      'imagePath' : impPath,
      'type' : type.toString(),
      

  
  };

  Recipe({
    required this.title,
    required this.calories,
    required this.ingreadiants,
    required this.instructions,
    required this.type,
    required this.impPath,
    // required this.time,
    this.isFav = false,
    this.servings = 1,
  });

  


  
}
