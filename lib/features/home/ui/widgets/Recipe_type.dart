import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';

class RecipeType extends StatefulWidget {
  @override
  _RecipeTypeState createState() => _RecipeTypeState();
}

class _RecipeTypeState extends State<RecipeType> {
  String? selectedRecipeType;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _MyRadio("Breakfast"),

        Text("Breakfast" , style: MyTextStyle.hellothin,),
        // SizedBox(width: 8),
        _MyRadio("Lunch"),

        Text("Lunch", style: MyTextStyle.hellothin,),
        // SizedBox(width: 8),
        _MyRadio("Dinner"),

        Text("Dinner", style: MyTextStyle.hellothin,),
        // SizedBox(width: 8),
        _MyRadio("Dessert"),
        Text("Dessert", style: MyTextStyle.hellothin,),
      ],
    );
  }

  Widget _MyRadio(String val) {
    return Radio<String>(
      value: val,
      groupValue: selectedRecipeType,
      fillColor: WidgetStateProperty.all(MyColors.greycolor),
      onChanged: (String? value) {
        setState(() {
          selectedRecipeType = value;
        });
      },
    );
  }
}
