// ignore_for_file: unused_import

import 'package:cooking_app/checkuser.dart';
import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/user_info_cubit.dart';
import 'package:cooking_app/features/home/logic/user_info_state.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/gen/assets.gen.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteBar extends StatelessWidget {
  const FavoriteBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36, left: 12),
      child: Row(
        children: [
        
          SvgPicture.asset(
            const $AssetsImagesGen().filledHeart,
            colorFilter: ColorFilter.mode(
              MyColors.greycolor,
              BlendMode.srcIn,
            ),
            width: 28, // Adjust width as needed
            height: 28, // Adjust height as needed
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<UserInfoCubit, UserinfoState>(
                builder: (context, state) {
                  if (state is UserinfoStateLoading) {
                    return Text('Loading...',
                        style: MyTextStyle.question);
                  } else if (state is UserinfoStateLoaded) {
                    Userfbs? user = state.data as Userfbs?;
                    return Text(
                      'Liked By ${user?.username ?? 'Unknown'}',
                      style: MyTextStyle.question,
                      overflow: TextOverflow.ellipsis,
                    );
                  } else if (state is UserinfoStateError) {
                    return Text(
                      'Error loading user info',
                      style: MyTextStyle.question,
                    );
                  } else {
                    return Text(
                      'User info unavailable',
                      style: MyTextStyle.question,
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
