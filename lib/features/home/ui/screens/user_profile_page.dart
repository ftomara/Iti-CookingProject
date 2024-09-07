// ignore_for_file: prefer_const_constructors

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_state.dart';
import 'package:cooking_app/features/home/logic/user_cubit.dart';
import 'package:cooking_app/features/home/logic/user_info_cubit.dart';
import 'package:cooking_app/features/home/logic/user_info_state.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/features/home/ui/widgets/follow_button.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card_gen_fbs.dart';
import 'package:cooking_app/features/home/ui/widgets/user_profile_appbar.dart';
import 'package:cooking_app/features/home/ui/widgets/user_profile_info.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/recipe.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    String? userId = context.read<UserCubit>().state;
    context.read<UserInfoCubit>().getuser(userId!);
    return BlocBuilder<UserInfoCubit, UserinfoState>(
      builder: (context, state) {
        if (state is UserinfoStateLoading) {
          return Center(
              child: Column(
            children: [
              CircularProgressIndicator(
                color: MyColors.orangecolor,
              ),
              Text('Loading...', style: MyTextStyle.hello),
            ],
          ));
        } else if (state is UserinfoStateLoaded) {
          Userfbs? user = state.data as Userfbs?;
          print('recipes length : ${user?.recipeslength}');
          return Padding(
              padding: const EdgeInsets.only(top: 36),
              child: Column(
                children: [
                  UserProfileAppbar(user?.username),
                  UserProfileInfo(user?.recipeslength ?? 0),
                  FollowButton(),
                  SizedBox(
                    height: 8.h,
                  ),
                  Expanded(
                    child: RecipeCardGenfbs(),
                  ),
                ],
              ));
        } else if (state is UserinfoStateError) {
          return Text('Hello, Guest! error', style: MyTextStyle.hello);
        } else {
          return const Text('Error loading user data.');
        }
      },
    );
    // SizedBox(height:500,),
  }
}
