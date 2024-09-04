import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/ui/widgets/calories_input_field.dart';
import 'package:cooking_app/features/home/ui/widgets/add_list_field.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_title_input_field.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_type_radiobutton.dart';
import 'package:cooking_app/features/home/ui/widgets/time_input_field.dart';
import 'package:cooking_app/features/home/ui/widgets/upload_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../my_colors.dart';

class UploadRecipePage extends StatefulWidget {
  const UploadRecipePage({super.key});

  @override
  State<UploadRecipePage> createState() => _UploadRecipePageState();
}

class _UploadRecipePageState extends State<UploadRecipePage> {
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final List<String> ingreadientsList = [];
  final List<String> instructionsList = [];

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Add listeners to controllers
    hoursController.addListener(_validateFields);
    minutesController.addListener(_validateFields);
    caloriesController.addListener(_validateFields);
    titleController.addListener(_validateFields);
  }

  @override
  void dispose() {
    // Dispose controllers
    hoursController.dispose();
    minutesController.dispose();
    caloriesController.dispose();
    titleController.dispose();
    super.dispose();
  }

  void _validateFields() {
    setState(() {
      isButtonEnabled = (hoursController.text.isNotEmpty ||
              minutesController.text.isNotEmpty) &&
          caloriesController.text.isNotEmpty &&
          titleController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 36,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Recipe',
              style: MyTextStyle.add_recipe,
            ),
            const Center(
              child: UploadBox(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Recipe Type :',
              style: MyTextStyle.question,
            ),
            SizedBox(
              height: 12.h,
            ),
            const RecipeTypeRadiobutton(),
            SizedBox(
              height: 12.h,
            ),
            RecipeTitleInputField(titleController: titleController),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                TimeInputField(
                  hoursController: hoursController,
                  minutesController: minutesController,
                ),
                const SizedBox(
                  width: 18,
                ),
                CaloriesInputField(caloriesController: caloriesController),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              'Ingredients:',
              style: MyTextStyle.question,
            ),
            SizedBox(
              height: 12.h,
            ),
            AddListField(
              hintText: '+   Add food to recipe.',
              list: ingreadientsList,
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              'Instructions:',
              style: MyTextStyle.question,
            ),
            SizedBox(
              height: 12.h,
            ),
            AddListField(
              hintText: '+   Add Instruction.',
              list: instructionsList,
            ),
            SizedBox(
              height: 12.h,
            ),
            Center(
              child: ElevatedButton(
                onPressed: isButtonEnabled ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.orangecolor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Add Recipe',
                  style: MyTextStyle.add_recipe_button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
