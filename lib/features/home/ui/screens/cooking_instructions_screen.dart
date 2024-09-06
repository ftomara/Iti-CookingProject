import 'package:cooking_app/core/di/module.dart';
import 'package:cooking_app/features/home/logic/id_recipe.dart';
import 'package:cooking_app/features/home/logic/recipe_info_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_state.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../my_colors.dart';
import '../widgets/incstructions_screen.dart';
import '../widgets/ingreadients_screen.dart';
import '../widgets/rate_meal_screen.dart';
import '../widgets/start_cooking_screen.dart';

class CookingInstructionsScreen extends StatelessWidget {
  CookingInstructionsScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.butterycolor,
      body: BlocBuilder<IdRecipe, int>(
        builder: (context, id) {
          context.read<RecipeInfoCubit>().emitState(id);

          return BlocConsumer<RecipeInfoCubit, RecipeState>(
            listener: (context, state) {
              if (state is RecipeStateError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Failed to load recipes: ${state.e}")),
                );
              }
            },
            builder: (context, state) {
              if (state is RecipeStateLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is RecipeStateLoaded) {
                RecipeInfo recipeInfo = state.data;

                return PageView(
                  controller: _pageController,
                  children: [
                    StartCookingScreen(pageController: _pageController),
                    IngreadientsScreen(recipe: recipeInfo),
                    IncstructionsScreen(recipe: recipeInfo),
                    const RateMealScreen(),
                  ],
                );
              } else {
                return Center(child: Text("Unexpected state"));
              }
            },
          );
        },
      ),
    );
  }
}
