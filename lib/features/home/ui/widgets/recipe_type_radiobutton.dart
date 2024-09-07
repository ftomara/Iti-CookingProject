import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/Recipe_Type_cubit.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> Stashed changes

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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<RecipeTypes>(
          value: type,
          groupValue: selectedRecipeType,
          fillColor: WidgetStatePropertyAll(MyColors.greycolor),
          // visualDensity: VisualDensity(),
          onChanged: (value) {
            setState(() {
              selectedRecipeType = value!;
              context.read<RecipeTypeCubit>().setRecipeTypeCubitpath(selectedRecipeType);
            });
          },
        ),
        Text(label, style: MyTextStyle.hellothin),
      ],
    );
  }
}
