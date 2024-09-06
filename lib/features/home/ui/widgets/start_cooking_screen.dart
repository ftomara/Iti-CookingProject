import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../my_colors.dart';
import 'animated_button.dart';
import 'back_button_appbar.dart';

class StartCookingScreen extends StatelessWidget {
  const StartCookingScreen({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BackButtonAppbar(),
          Padding(
            padding: EdgeInsets.only(top: 70.h, left: 38.w, right: 38.w),
            child: Container(
              width: 355.w,
              height: 660.h,
              // height: double.infinity,
              decoration: BoxDecoration(
                color: MyColors.orangecolor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 64.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 42.w),
                      child: Column(
                        children: [
                          Text(
                            '''Hey!''',
                            style: GoogleFonts.oswald(
                              color: MyColors.butterycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '''Let’s Enjoy Some Cookin’''',
                            style: GoogleFonts.oswald(
                              color: MyColors.butterycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.h),
                      child: Lottie.asset(
                          'assets/animations/lets_cook_animation.json',
                          fit: BoxFit.cover,
                          height: 284.h,
                          width: 284.w),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 99.w),
                      child: AnimatedButton(
                        pageController: pageController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
