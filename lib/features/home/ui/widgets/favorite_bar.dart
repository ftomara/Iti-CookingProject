// ignore_for_file: unused_import

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/gen/assets.gen.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteBar extends StatelessWidget {
  const FavoriteBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8 , left: 16),
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
              Text('Liked By Sherly',
                  style: MyTextStyle.question, overflow: TextOverflow.ellipsis)
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
