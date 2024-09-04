// ignore_for_file: prefer_const_constructors

import 'package:cooking_app/features/home/ui/widgets/follow_button.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card_gen.dart';
import 'package:cooking_app/features/home/ui/widgets/user_profile_appbar.dart';
import 'package:cooking_app/features/home/ui/widgets/user_profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/recipe.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: Column(
        children: [
          UserProfileAppbar(),
          UserProfileInfo(),
          FollowButton(),
          SizedBox(
            height: 8.h,
          ),
          Expanded(
              child: RecipeCardGen(
            // recipeList: recipes,
          )),
          // SizedBox(height:500,),
        ],
      ),
    );
  }
}
