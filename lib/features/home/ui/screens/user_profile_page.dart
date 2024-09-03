// ignore_for_file: prefer_const_constructors

import 'package:cooking_app/features/home/ui/widgets/follow_button.dart';
import 'package:cooking_app/features/home/ui/widgets/nav_bar.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card_gen.dart';
import 'package:cooking_app/features/home/ui/widgets/search.dart';
import 'package:cooking_app/features/home/ui/widgets/user_profile_appbar.dart';
import 'package:cooking_app/features/home/ui/widgets/user_profile_info.dart';
import 'package:cooking_app/features/home/ui/widgets/users_card.dart';
import 'package:cooking_app/features/home/ui/widgets/users_card_gen.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.butterycolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 36),
        child: Column(
          children: [
            UserProfileAppbar(),
            UserProfileInfo(),
            FollowButton(),
            SizedBox(
              height: 8.h,
            ),
            Expanded(child: RecipeCardGen()),
            // SizedBox(height:500,),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
