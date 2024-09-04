// ignore_for_file: prefer_const_constructors

import 'package:cooking_app/features/home/logic/recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_state.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeCardGen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// takes a recipeinfo object to generate
    return BlocBuilder<RecipeCubit, RecipeState>(
      builder: (context, state) {
        if (state is RecipeStateLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RecipeStateError) {
          return Center(
              child: Text("Failed to load recipes: ${state.e.message}"));
        } else if (state is RecipeStateLoaded) {
          RecipeApi recipeData = state.data;
          List<Result> results =
              recipeData.result.map((hit) => hit.recipe).toList();

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: results.length,
            itemBuilder: (context, index) {
              return RecipeCard(result: results[index]);
            },
          );
        } else {
          print("ff");
          return Center(child: Text("Please select a recipe category"));
        }
      },
    );
  }
}
