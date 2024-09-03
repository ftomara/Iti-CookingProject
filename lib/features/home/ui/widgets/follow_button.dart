import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/gen/assets.gen.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 40.h,
              width: 335.w,
              decoration: BoxDecoration(
                color: MyColors.orangecolor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(const $AssetsImagesGen().followicon),
                  SizedBox(width: 4.w),
                  Text(
                    'Follow',
                    style: MyTextStyle.user_follower16,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
