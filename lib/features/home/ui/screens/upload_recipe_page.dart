// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/ui/widgets/Recipe_type.dart';
import 'package:cooking_app/features/home/ui/widgets/catigories.dart';
import 'package:cooking_app/features/home/ui/widgets/nav_bar.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card_gen.dart';
import 'package:cooking_app/features/home/ui/widgets/search.dart';
import 'package:cooking_app/features/home/ui/widgets/upload_box.dart';
import 'package:cooking_app/features/home/ui/widgets/welcoming_bar.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadRecipePage extends StatelessWidget {
  const UploadRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.butterycolor,
        body: Column(
          children: [
            SizedBox(
              height: 36.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 18.w,
                ),
                Text(
                  'Add Recipe',
                  style: MyTextStyle.add_recipe,
                ),
              ],
            ),
            UploadBox(),
            SizedBox(
              height: 18.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 18.w,
                ),
                Text(
                  'Recipe Type',
                  style: MyTextStyle.question,
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            RecipeType(),
          ],
        ),
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}
