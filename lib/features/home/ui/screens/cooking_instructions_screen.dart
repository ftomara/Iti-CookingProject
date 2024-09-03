import 'package:flutter/material.dart';

import '../../model/recipe.dart';
import '../../model/recipe_types.dart';
import '../../model/time.dart';
import '../widgets/incstructions_screen.dart';
import '../widgets/ingreadients_screen.dart';
import '../widgets/rate_meal_screen.dart';
import '../widgets/start_cooking_screen.dart';

class CookingInstructionsScreen extends StatelessWidget {
  CookingInstructionsScreen({super.key});

  final PageController _pageController = PageController();

  final List<Recipe> recipes = [
    Recipe(
      title: 'Spicy Ramen Noodles',
      chef: 'Mady Miller',
      rate: 5,
      calories: 602,
      ingreadiants: [
        '1 tbsp Garlic',
        '1 Green onion',
        '1.5 tbsp Peanuts, dry roasted',
        '3 tbsp Chili',
        '1 tbsp Peanut butter',
        '2 tsp Soy sauce',
        '1 package Ramen noodles, instant',
        '1 tsp Sugar',
        '1 tbsp Rice wine vinegar',
        '2 tbsp Water',
      ],
      instructions: [
        'Cook noodles in boiling water according to pack directions. Drain, rinse in colander under cool water and set aside.',
        'In a mixing bowl whisk together chili crisp, water, peanut butter, mirin, soy sauce, sugar, and garlic. Set aside.',
        'Add noodles to mixing bowl and toss together with sauce until evenly coated.',
        'Transfer noodles to a serving bowl and top with crushed peanuts, green onions and more chili crisp.',
      ],
      type: RecipeTypes.lunch,
      impPath: 'assets/images/ramen_dummy.png',
      time: const Time(hours: 0, min: 20),
    ),
    Recipe(
      title: 'Pancakes',
      chef: 'Chef John',
      rate: 5,
      calories: 200.0,
      ingreadiants: [
        'Flour',
        'Milk',
        'Eggs',
        'Sugar',
        'Butter',
      ],
      instructions: [
        'Mix ingredients',
        'Cook on stove',
        'Serve hot',
      ],
      type: RecipeTypes.breakfast,
      impPath: 'assets/images/pancakes_dummy.png',
      time: const Time(hours: 0, min: 25),
    ),
    Recipe(
      title: 'Spaghetti Bolognese',
      chef: 'Chef Anna',
      rate: 4,
      calories: 450.0,
      ingreadiants: [
        'Pasta',
        'Tomato Sauce',
        'Ground Beef',
        'Garlic',
        'Olive Oil',
      ],
      instructions: [
        'Boil pasta',
        'Cook sauce',
        'Combine and serve',
      ],
      type: RecipeTypes.lunch,
      impPath: 'assets/images/spaghetti_dummy.png',
      time: const Time(hours: 0, min: 30),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        StartCookingScreen(
          pageController: _pageController,
        ),
        IngreadientsScreen(recipe: recipes[2]),
        IncstructionsScreen(recipe: recipes[2]),
        const RateMealScreen(),
      ],
    );
  }
}
