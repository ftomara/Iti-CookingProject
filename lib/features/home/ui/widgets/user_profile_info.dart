// ignore_for_file: unused_import

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h,),
        Row(
          children: [
            const SizedBox(
              width: 36,
            ),
            CircleAvatar(
              radius: 40,
              backgroundColor: MyColors.orangecolor,
            ),
            const SizedBox(
              width: 48,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '5K',
                      style: MyTextStyle.hello,
                    ),
                    Text(
                      'Followers',
                      style: MyTextStyle.hellothin,
                    ),
                  ],
                ),
                SizedBox(
                  width: 36.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '512',
                      style: MyTextStyle.hello,
                    ),
                    Text(
                      'Recipes',
                      style: MyTextStyle.hellothin,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ],
    );
  }
}
