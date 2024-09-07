import 'package:cooking_app/core/themes/my_text_style.dart';
<<<<<<< Updated upstream
=======
import 'package:cooking_app/features/home/logic/Recipe_Type_cubit.dart';
import 'package:cooking_app/features/home/logic/image_cubit.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_state.dart';
import 'package:cooking_app/features/home/logic/user_cubit.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/ui/screens/home_page.dart';
// import 'package:cooking_app/features/home/ui/widgets/calories_input_field.dart';
>>>>>>> Stashed changes
import 'package:cooking_app/features/home/ui/widgets/servings_input_field.dart';
import 'package:cooking_app/features/home/ui/widgets/add_list_field.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_title_input_field.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_type_radiobutton.dart';
import 'package:cooking_app/features/home/ui/widgets/time_input_field.dart';
import 'package:cooking_app/features/home/ui/widgets/upload_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../my_colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Assuming UploadRecipeCubit has states like UploadInitial, UploadInProgress, UploadSuccess, UploadFailure

class UploadRecipePage extends StatefulWidget {
  const UploadRecipePage({super.key});

  @override
  State<UploadRecipePage> createState() => _UploadRecipePageState();
}

class _UploadRecipePageState extends State<UploadRecipePage> {
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController servingsController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final List<String> ingreadientsList = [];
  final List<String> instructionsList = [];

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    minutesController.addListener(_validateFields);
    servingsController.addListener(_validateFields);
    titleController.addListener(_validateFields);
  }

  @override
  void dispose() {
    minutesController.dispose();
    servingsController.dispose();
    titleController.dispose();
    super.dispose();
  }

  void _validateFields() {
    setState(() {
      isButtonEnabled = minutesController.text.isNotEmpty &&
          servingsController.text.isNotEmpty &&
          titleController.text.isNotEmpty;
    });
  }

  void _clearFields() {
    titleController.clear();
    minutesController.clear();
    servingsController.clear();
    ingreadientsList.clear();
    instructionsList.clear();
  }

  void _uploadRecipe(BuildContext context) {
    final recipe = Recipe(
      title: titleController.text,
      ingreadiants: ingreadientsList,
      instructions: instructionsList,
      type: context.read<RecipeTypeCubit>().state,
      impPath: context.read<ImageCubit>().state,
      readyInMinutes: int.parse(minutesController.text),
      servings: int.parse(servingsController.text),
    );

    context
        .read<UploadRecipeCubit>()
        .uploadRecipe(recipe, context.read<UserCubit>().state!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadRecipeCubit, UploadRecipeState>(
      listener: (context, state) {
        if (state is UploadRecipeStateLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Recipe uploaded successfully!')),
          );
          _clearFields();
        } else if (state is UploadRecipeStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Failed to upload recipe. Try again.')),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 36.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Recipe', style: MyTextStyle.add_recipe),
              const Center(child: UploadBox()),
              SizedBox(height: 20.h),
              Text('Recipe Type :', style: MyTextStyle.question),
              const RecipeTypeRadiobutton(),
              RecipeTitleInputField(titleController: titleController),
              Row(
                children: [
                  TimeInputField(minutesController: minutesController),
                  SizedBox(width: 12.w),
                  ServingsInputField(servingsController: servingsController),
                ],
              ),
              AddListField(
                  hintText: '+   Add food to recipe.', list: ingreadientsList),
              AddListField(
                  hintText: '+   Add Instruction.', list: instructionsList),
              Center(
                child: BlocBuilder<UploadRecipeCubit, UploadRecipeState>(
                  builder: (context, state) {
                    if (state is UploadRecipeStateLoading) {
                      return const CircularProgressIndicator(); 
                    }

                    return ElevatedButton(
                      onPressed:
                          isButtonEnabled ? () => _uploadRecipe(context) : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.orangecolor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text('Add Recipe',
                          style: MyTextStyle.add_recipe_button),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
