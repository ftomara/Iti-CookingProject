import 'recipe_types.dart';
// import 'time.dart';

class Recipe {
  Recipe({
    required this.title,
    required this.chef,
    // required this.rate,
    required this.calories,
    required this.ingreadiants,
    required this.instructions,
    required this.type,
    required this.impPath,
    // required this.time,
    this.isFav = false,
    this.servings = 1,
  });

  final String title;
  final String chef;
  // final int rate;
  final int servings;
  final double calories;
  final List<String> ingreadiants;
  final List<String> instructions;
  final RecipeTypes type;
  final String impPath;
  // final Time time;
  bool isFav = false;
}
