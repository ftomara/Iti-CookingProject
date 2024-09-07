// ignore_for_file: prefer_const_constructors

import 'package:cooking_app/features/home/logic/recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_state.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_state.dart';
import 'package:cooking_app/features/home/logic/user_cubit.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card_fbs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeCardGenfbs extends StatelessWidget {
  const RecipeCardGenfbs({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UploadRecipeCubit>().fetchAllRecipes(context.read<UserCubit>().state);
      return BlocBuilder<UploadRecipeCubit, UploadRecipeState>(
      builder: (context, state) {
        if (state is UploadRecipeStateLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UploadRecipeStateError) {
          return Center(
              child: Text("Failed to load recipes: ${state.e.message}"));
        } else if (state is UploadRecipeStateLoaded) {
          List<Recipe> results = state.data;
          return GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: 24, vertical: 0), // Padding around the grid
            physics: BouncingScrollPhysics(),
            itemCount: results.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two cards per row
              childAspectRatio: 0.75, // Aspect ratio to make the cards taller
            ),
            itemBuilder: (context, index) {
              return RecipeCardfbs(result: results[index]);
            },
          );
        } else {
          return Center(child: Text("Please select a recipe category"));
        }
      },
    );
  }
}
