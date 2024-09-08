// ignore_for_file: must_be_immutable

import 'package:cooking_app/core/di/module.dart';
import 'package:cooking_app/features/home/logic/api_or_fbs_cubit.dart';
import 'package:cooking_app/features/home/logic/id_recipe.dart';
import 'package:cooking_app/features/home/logic/recipe_info_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_state.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_state.dart';
import 'package:cooking_app/features/home/logic/user_cubit.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../my_colors.dart';
import '../widgets/incstructions_screen.dart';
import '../widgets/ingreadients_screen.dart';
import '../widgets/finish_cooking_screen.dart';
import '../widgets/start_cooking_screen.dart';

class CookingInstructionsScreen extends StatelessWidget {
  CookingInstructionsScreen({this.recipeTitle, this.userId, super.key});
  String? recipeTitle;
  String? userId;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    userId = context.read<UserCubit>().state;
    return Scaffold(
      backgroundColor: MyColors.butterycolor,
      body: BlocBuilder<ApiOrFbsCubit, bool?>(builder: (context, state) {
        if (state!) {
          return BlocBuilder<IdRecipe, int>(
            builder: (context, id) {
              context.read<RecipeInfoCubit>().emitState(id);

              return BlocConsumer<RecipeInfoCubit, RecipeState>(
                listener: (context, state) {
                  if (state is RecipeStateError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Failed to load recipes: ${state.e}"),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is RecipeStateLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: MyColors.orangecolor,
                      ),
                    );
                  } else if (state is RecipeStateLoaded) {
                    RecipeInfo recipeInfo = state.data;

                    return PageView(
                      controller: _pageController,
                      children: [
                        StartCookingScreen(pageController: _pageController),
                        IngreadientsScreen(recipeapi: recipeInfo),
                        IncstructionsScreen(recipeapi: recipeInfo),
                        FinishCookingScreen(recipe: recipeInfo),
                      ],
                    );
                  } else {
                    return const Center(child: Text("Unexpected state"));
                  }
                },
              );
            },
          );
        } else {
          context.read<UploadRecipeCubit>().fetchRecipe(userId!, recipeTitle!);

          return BlocBuilder<UploadRecipeCubit, UploadRecipeState>(
            builder: (context, state) {
              if (state is UploadRecipeStateLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: MyColors.orangecolor,
                  ),
                );
              } else if (state is UploadRecipeStateLoaded) {
                Recipe recipeInfo = state.data;

                return PageView(
                  controller: _pageController,
                  children: [
                    StartCookingScreen(pageController: _pageController),
                    IngreadientsScreen(recipefbs: recipeInfo),
                    IncstructionsScreen(recipefbs: recipeInfo),
                    FinishCookingScreen(recipe: null),
                  ],
                );
              } else {
                return const Center(child: Text("Unexpected state"));
              }
            },
          );
        }
      }),
    );
  }
}
