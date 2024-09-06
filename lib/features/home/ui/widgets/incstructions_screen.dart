import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:flutter/material.dart';

import 'back_button_appbar.dart';
import 'instrcutions_listview.dart';

class IncstructionsScreen extends StatelessWidget {
  const IncstructionsScreen({super.key, required this.recipe});

  final RecipeInfo recipe;

  @override
  Widget build(BuildContext context) {
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
                title: "${recipe.title}",
              ),
              const SizedBox(
                height: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  recipe.image!,
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
                recipe: recipe,
                isIngredients: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
