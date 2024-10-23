// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersCard extends StatefulWidget {
  const UsersCard(this.user, {super.key});
  final Userfbs user;
  @override
  State<UsersCard> createState() => _UsersCardState();
}

class _UsersCardState extends State<UsersCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 90.h,
            width: 330.w,
            decoration: BoxDecoration(
              color: MyColors.orangecolor,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.grey.withOpacity(0.5), // Shadow color with opacity
                  spreadRadius: 2.dg, // How much the shadow spreads
                  blurRadius: 4.dg, // How much the shadow is blurred
                  offset: const Offset(0, 3), // Position of the shadow (x, y)
                ),
              ],
            ),
            // margin: EdgeInsets.only(top: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.user.imageUrl),
                  radius: 16,
                  backgroundColor: MyColors.greycolor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      widget.user.username ?? 'Guest',
                      style: MyTextStyle.recipe_title,
                    ),
                    Row(
                      children: [
                        Text(
                          '''5K ''',
                          style: MyTextStyle.user_follower_number,
                        ),
                        Text(
                          'Followers',
                          style: MyTextStyle.user_follower,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          '''${widget.user.recipeslength} ''',
                          style: MyTextStyle.user_follower_number,
                        ),
                        Text(
                          'Recipes',
                          style: MyTextStyle.user_follower,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
