import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';

import '../../model/recipe_types.dart';

class RecipeTypeRadiobutton extends StatefulWidget {
  const RecipeTypeRadiobutton({super.key});

  @override
  State<RecipeTypeRadiobutton> createState() => _RecipeTypeRadiobuttonState();
}

class _RecipeTypeRadiobuttonState extends State<RecipeTypeRadiobutton> {
  RecipeTypes selectedRecipeType = RecipeTypes.breakfast;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _myRadio(RecipeTypes.breakfast, "Breakfast"),
        Text("Breakfast", style: MyTextStyle.hellothin),
        _myRadio(RecipeTypes.lunch, "Lunch"),
        Text("Lunch", style: MyTextStyle.hellothin),
        _myRadio(RecipeTypes.dinner, "Dinner"),
        Text("Dinner", style: MyTextStyle.hellothin),
        _myRadio(RecipeTypes.dessert, "Dessert"),
        Text("Dessert", style: MyTextStyle.hellothin),
      ],
    );
  }

  Widget _myRadio(RecipeTypes type, String label) {
    return Radio<RecipeTypes>(
      value: type,
      groupValue: selectedRecipeType,
      fillColor: WidgetStateProperty.all(MyColors.greycolor),
      onChanged: (value) {
        setState(() {
          selectedRecipeType = value!;
        });
      },
    );
  }
}
