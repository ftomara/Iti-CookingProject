import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/api_or_fbs_cubit.dart';
import 'package:cooking_app/features/home/logic/id_recipe.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/cooking_instructions_screen.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({super.key, required this.result});
  final Result result;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          height: 232.h,
          width: 164.w,
          decoration: BoxDecoration(
            color: MyColors.orangecolor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: //Stack(
              // children: [
              Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.result.image!,
                    width: 112.w,
                    height: 112.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons
                          .error); // Display an error icon or a placeholder
                    },
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  widget.result.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle.recipe_title,
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<ApiOrFbsCubit>().setdatasource(true);
                    context.read<IdRecipe>().setId(widget.result.id!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CookingInstructionsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 108.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: MyColors.butterycolor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 40, 40, 40)
                              .withOpacity(0.5), // Shadow color with opacity
                          spreadRadius: 0, // How much the shadow spreads
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Cook",
                        style: MyTextStyle.cook,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
