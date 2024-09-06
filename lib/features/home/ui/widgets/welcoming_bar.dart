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
import 'package:get_it/get_it.dart';

class WelcomingBar extends StatelessWidget {
  const WelcomingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, String?>(
      builder: (context, userId) {
        // Check if the userId is null or not
        if (userId == null || userId.isEmpty) {
          print("welcome : $userId");
          return Row(
            children: [
              const SizedBox(width: 24),
              CircleAvatar(
                radius: 30,
                backgroundColor: MyColors.orangecolor,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, Guest! null', style: MyTextStyle.hello),
                  Text('What do you Want to Eat Today?',
                      style: MyTextStyle.question,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
              const SizedBox(width: 16),
            ],
          );
        } else {
          context.read<UserInfoCubit>().getuser(userId);
          print("welcome good : $userId");
          return Row(
            children: [
              const SizedBox(width: 24),
              CircleAvatar(
                radius: 30,
                backgroundColor: MyColors.orangecolor,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<UserInfoCubit, UserinfoState>(
                    builder: (context, state) {
                      if (state is UserinfoStateLoading) {
                        return Text('Loading...', style: MyTextStyle.hello);
                      } else if (state is UserinfoStateLoaded) {
                        Userfbs? user = state.data as Userfbs?;
                        return Text('Hello, ${user?.username ?? "null"}!',
                            style: MyTextStyle.hello);
                      } else if (state is UserinfoStateError) {
                        return Text('Hello, Guest! error',
                            style: MyTextStyle.hello);
                      } else {
                        return Text('Hello, Guest!else',
                            style: MyTextStyle.hello);
                      }
                    },
                  ),
                  Text('What do you Want to Eat Today?',
                      style: MyTextStyle.question,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
              const SizedBox(width: 16),
            ],
          );
        }
      },
    );
  }
}
