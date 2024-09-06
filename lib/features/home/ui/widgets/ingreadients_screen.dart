import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/features/home/ui/widgets/equipments_listview.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    final equipmentList = recipe.analyzedInstructions
        ?.expand((instruction) => instruction.steps ?? [])
        .expand((step) => step.equipment ?? [])
        .toList();

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonAppbar(title: "${recipe.title}"),
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
                recipe: recipe,
                isIngredients: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
