// ignore_for_file: unused_import

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/user_cubit.dart';
import 'package:cooking_app/features/home/logic/user_info_cubit.dart';
import 'package:cooking_app/features/home/logic/user_info_state.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class WelcomingBar extends StatelessWidget {
  const WelcomingBar({super.key});

  @override
  Widget build(BuildContext context) {
    Userfbs? user;
    return BlocBuilder<UserCubit, String?>(
      builder: (context, userId) {
        if (userId == null || userId.isEmpty) {
          print("welcome : $userId");
          return Row(
            children: [
              SizedBox(width: 24.w),
              CircleAvatar(
                radius: 30.sp,
                backgroundColor: MyColors.orangecolor,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, Guest! null', style: MyTextStyle.hello),
                  Text('What do you Want to Eat Today?',
                      style: MyTextStyle.question,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
              SizedBox(width: 16.w),
            ],
          );
        } else {
          context.read<UserInfoCubit>().getuser(userId);
          print("welcome good : $userId");
          return BlocBuilder<UserInfoCubit, UserinfoState>(
            builder: (context, state) {
              if (state is UserinfoStateLoading) {
                return Text('Loading...', style: MyTextStyle.hello);
              } else if (state is UserinfoStateLoaded) {
                user = state.data as Userfbs?;
                return Row(
                  children: [
                    SizedBox(width: 24.w),
                    CircleAvatar(
                      backgroundImage:
                          user != null ? NetworkImage(user!.imageUrl) : null,
                      radius: 30.sp,
                      backgroundColor: MyColors.orangecolor,
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, ${user?.username ?? "null"}!',
                            style: MyTextStyle.hello),
                        Text('What do you Want to Eat Today?',
                            style: MyTextStyle.question,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                    SizedBox(width: 16.w),
                  ],
                );
              } else if (state is UserinfoStateError) {
                return Text('Hello, Guest! error', style: MyTextStyle.hello);
              } else {
                return Text('Hello, Guest!else', style: MyTextStyle.hello);
              }
            },
          );
        }
      },
    );
  }
}
