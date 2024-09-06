import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Column(
      children: [
        Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _myRadio(RecipeTypes.breakfast, "Breakfast"),
            _myRadio(RecipeTypes.lunch, "Lunch"),
         
          ],
        ),
         Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
         
            _myRadio(RecipeTypes.dinner, "Dinner"),
            SizedBox(width: 18.w,),
            _myRadio(RecipeTypes.dessert, "Dessert"),
          ],
        ),
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
            });
          },
        ),
        Text(label, style: MyTextStyle.hellothin),
      ],
    );
      }
}
