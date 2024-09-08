import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:flutter/material.dart';

import 'back_button_appbar.dart';
import 'instrcutions_listview.dart';

class IncstructionsScreen extends StatelessWidget {
  const IncstructionsScreen({super.key, this.recipeapi, this.recipefbs});

  final RecipeInfo? recipeapi;
  final Recipe? recipefbs;

  @override
  Widget build(BuildContext context) {
    final recipe = recipeapi ?? recipefbs;

    if (recipe != null) {
      final imageUrl =
          recipeapi != null ? recipeapi?.image : recipefbs?.imageUrl;
      final title = recipeapi != null ? recipeapi?.title : recipefbs?.title;
      // final servings =
      //     recipeapi != null ? recipeapi?.servings : recipefbs?.servings;
      // final ingredients = recipeapi != null
      //     ? recipeapi?.extendedIngredients ?? []
      //     : recipefbs?.ingreadiants ?? [];
      // final instructions = recipeapi != null
      //     ? recipeapi?.analyzedInstructions
      //             ?.expand((instruction) => instruction.steps ?? [])
      //             .toList() ??
      //         []
      //     : recipefbs?.instructions ?? [];
      return SafeArea(
        child: SingleChildScrollView(
          // Wrap the whole content in SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonAppbar(
                  title: "$title",
                ),
                const SizedBox(
                  height: 16,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl!,
                    width: double.infinity,
                    height: 224,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Instructions:',
                  style: MyTextStyle.instructionsAndIngreadiants,
                ),
                const SizedBox(height: 16),
                InstrcutionsListview(
                  recipe: recipeapi,
                  recipefbs: recipefbs,
                  isIngredients: false,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return const Center(child: Text("No recipe data available"));
  }
}
