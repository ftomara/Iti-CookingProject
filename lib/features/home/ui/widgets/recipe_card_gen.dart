// ignore_for_file: prefer_const_constructors

import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

import '../../model/recipe.dart';

class RecipeCardGen extends StatefulWidget {
  const RecipeCardGen({super.key, required this.recipeList});

  final List<Recipe> recipeList;

  @override
  State<RecipeCardGen> createState() => _RecipeCardGenState();
}

class _RecipeCardGenState extends State<RecipeCardGen> {
  @override
  Widget build(BuildContext context) {
    /// takes a recipeinfo object to generate
    return ListView.builder(
        itemCount: widget.recipeList.length,
        itemBuilder: (context, index) {
          // print('list generated');
          return RecipeCard(
            recipe: widget.recipeList[index],
          );
        });
  }
}
