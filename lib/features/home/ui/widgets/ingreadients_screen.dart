import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/themes/my_text_style.dart';
import 'back_button_appbar.dart';
import 'instrcutions_listview.dart';

class IngreadientsScreen extends StatelessWidget {
  const IngreadientsScreen({super.key, required this.recipe});
  final RecipeInfo recipe;

  String recipeTime() {
    if (recipe.readyInMinutes! > 60) {
      int hrs = recipe.readyInMinutes! ~/ 60;
      int min = recipe.readyInMinutes! - (hrs * 60);
      return '$hrs hrs $min min';
    }
    return '${recipe.readyInMinutes} min';
  }

  @override
  Widget build(BuildContext context) {
    final steps = recipe.analyzedInstructions
            ?.expand((instruction) => instruction.steps ?? [])
            .toList() ??
        [];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonAppbar(title: "${recipe.title}"
                //recipe.title,
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
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/servings.svg'),
                const SizedBox(width: 4),
                Text(
                  recipe.servings! > 1
                      ? "${recipe.servings} Servings"
                      : "${recipe.servings} Serving",
                  style: MyTextStyle.serving,
                ),
                const SizedBox(width: 36),
                SvgPicture.asset(
                  'assets/images/timer.svg',
                ),
                const SizedBox(width: 4),
                Text(
                  recipeTime(),
                  style: MyTextStyle.serving,
                ),
                // const SizedBox(width: 4),
                // SvgPicture.asset('assets/images/calories.svg'),
                // Text(
                //   "${recipe.servings} kcal",
                //   style: MyTextStyle.serving,
                // ),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              'Ingreadients:',
              style: MyTextStyle.instructionsAndIngreadiants,
            ),
            const SizedBox(height: 16),
            InstrcutionsListview(
              recipe: recipe,
              isIngredients: true,
            )
            // ),
          ],
        ),
      ),
    );
    // return SafeArea(
    //   child: Column(
    //     children: [
    //       BackButtonAppbar(
    //         title: recipe.title!,
    //       ),
    //       Expanded(
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(
    //             horizontal: 28,
    //             vertical: 8,
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const SizedBox(
    //                 height: 8,
    //               ),
    //               Row(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   ClipRRect(
    //                     borderRadius: BorderRadius.circular(16),
    //                     child: Image.network(
    //                       recipe.image!,
    //                       width: 130,
    //                       height: 160,
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     width: 12,
    //                   ),
    //                   Expanded(
    //                     child: Column(
    //                       mainAxisSize: MainAxisSize.max,
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "${recipe.title}",
    //                           //    recipe.title,
    //                           style: GoogleFonts.oswald(
    //                             fontSize: 32,
    //                             fontWeight: FontWeight.bold,
    //                             color: MyColors.black,
    //                           ),
    //                         ),
    //                         const SizedBox(height: 4),
    //                         Row(
    //                           children: [
    //                             SvgPicture.asset('assets/images/servings.svg'),
    //                             const SizedBox(width: 4),
    //                             Text("serving"
    //                                 //     ? "${recipe.servings} Serving"
    //                                 //     : "${recipe.servings} Servings",
    //                                 // style: MyTextStyle.serving,
    //                                 ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(height: 18),
    //               Text(
    //                 'Check Your Ingredients:',
    //                 style: MyTextStyle.instructionsAndIngreadiants,
    //               ),
    //               const SizedBox(height: 16),
    //               InstrcutionsListview(
    //                 recipe: recipe,
    //                 isIngredients: true,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
