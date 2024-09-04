import 'package:flutter/material.dart';

import '../../../../my_colors.dart';
import '../../model/recipe.dart';
import '../widgets/incstructions_screen.dart';
import '../widgets/ingreadients_screen.dart';
import '../widgets/rate_meal_screen.dart';
import '../widgets/start_cooking_screen.dart';

class CookingInstructionsScreen extends StatelessWidget {
  CookingInstructionsScreen({super.key, required this.recipe});

  final PageController _pageController = PageController();

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.butterycolor,
      body: PageView(
        controller: _pageController,
        children: [
          StartCookingScreen(
            pageController: _pageController,
          ),
          IngreadientsScreen(recipe: recipe),
          IncstructionsScreen(recipe: recipe),
          const RateMealScreen(),
        ],
      ),
    );
  }
}
