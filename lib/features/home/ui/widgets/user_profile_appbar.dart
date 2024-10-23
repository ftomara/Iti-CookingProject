// ignore_for_file: unused_import

import 'package:cooking_app/core/network/firebase/authenticate%20.dart';
import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../logic/user_cubit.dart';

class UserProfileAppbar extends StatelessWidget {
  const UserProfileAppbar(this.username, {super.key});
  final String? username;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 18.w,
        ),
        //  Icon(Icons.arrow_back, color: MyColors.greycolor,),
        SizedBox(
          width: 18.w,
        ),
        Text(
          username!,
          style: MyTextStyle.user_name,
        ),
        const Spacer(),
        IconButton(
            onPressed: () async {
              await AuthenticateImpl(GetIt.instance<UserCubit>())
                  .signOutUser(context); // Call logout function
            },
            icon: Icon(
              Icons.logout,
              color: MyColors.greycolor,
            ))
      ],
    );
  }
}
