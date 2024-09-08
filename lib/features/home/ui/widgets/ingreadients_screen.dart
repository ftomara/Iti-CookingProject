import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/features/home/ui/widgets/equipments_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/themes/my_text_style.dart';
import 'back_button_appbar.dart';
import 'instrcutions_listview.dart';

class IngreadientsScreen extends StatelessWidget {
  const IngreadientsScreen({super.key, this.recipeapi, this.recipefbs});

  final RecipeInfo? recipeapi;
  final Recipe? recipefbs;

  String recipeTime(RecipeInfo? recipeApiData, Recipe? recipeFbsData) {
    final int readyInMinutes =
        recipeApiData?.readyInMinutes ?? recipeFbsData?.readyInMinutes ?? 0;
    if (readyInMinutes > 60) {
      int hrs = readyInMinutes ~/ 60;
      int min = readyInMinutes - (hrs * 60);
      return '$hrs hrs $min min';
    }
    return '$readyInMinutes min';
  }

  @override
  Widget build(BuildContext context) {
    final recipe = recipeapi ?? recipefbs;

    if (recipe != null) {
      final imageUrl =
          recipeapi != null ? recipeapi?.image : recipefbs?.imageUrl;
      final title = recipeapi != null ? recipeapi?.title : recipefbs?.title;
      final servings =
          recipeapi != null ? recipeapi?.servings : recipefbs?.servings;
      // final ingredients = recipeapi != null
      //     ? recipeapi?.extendedIngredients ?? []
      //     : recipefbs?.ingreadiants ?? [];
      // final instructions = recipeapi != null
      //     ? recipeapi?.analyzedInstructions
      //             ?.expand((instruction) => instruction.steps ?? [])
      //             .toList() ??
      //         []
      //     : recipefbs?.instructions ?? [];

      final equipmentList = recipeapi?.analyzedInstructions
          ?.expand((instruction) => instruction.steps ?? [])
          .expand((step) => step.equipment ?? [])
          .toSet() // Convert to Set to remove duplicates
          .toList(); // Convert back to List for displaying

      return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonAppbar(title: title ?? ""),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl ?? '',
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
                      (servings ?? 1) > 1
                          ? "$servings Servings"
                          : "$servings Serving",
                      style: MyTextStyle.serving,
                    ),
                    const SizedBox(width: 36),
                    SvgPicture.asset('assets/images/timer.svg'),
                    const SizedBox(width: 4),
                    Text(
                      recipeTime(recipeapi, recipefbs),
                      style: MyTextStyle.serving,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (equipmentList != null && equipmentList.isNotEmpty) ...[
                  Text(
                    'Equipment:',
                    style: MyTextStyle.instructionsAndIngreadiants,
                  ),
                  const SizedBox(height: 16),
                  EquipmentListView(equipmentList: equipmentList),
                  const SizedBox(height: 20),
                ],
                Text(
                  'Ingredients:',
                  style: MyTextStyle.instructionsAndIngreadiants,
                ),
                const SizedBox(height: 16),
                InstrcutionsListview(
                  recipe: recipeapi,
                  recipefbs: recipefbs,
                  isIngredients: true,
                ),
              ],
            ),
          ),
        ),
      );
    }

    // If neither recipeapi nor recipefbs is available
    return Center(child: Text("No recipe data available"));
  }
}
