import 'package:cooking_app/features/home/logic/recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_state.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeCardGen extends StatelessWidget {
  const RecipeCardGen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      builder: (context, state) {
        if (state is RecipeStateLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: MyColors.orangecolor,
            ),
          );
        } else if (state is RecipeStateError) {
          return Center(
              child: Text("Failed to load recipes: ${state.e.message}"));
        } else if (state is RecipeStateLoaded) {
          RecipeApi recipeData = state.data;
          List<Result> results = recipeData.result!;

          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0.h),
            physics: const BouncingScrollPhysics(),
            itemCount: results.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return RecipeCard(result: results[index]);
            },
          );
        } else {
          return const Center(child: Text("Please select a recipe category"));
        }
      },
    );
  }
}
