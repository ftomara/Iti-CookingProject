import 'package:flutter/material.dart';
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 18,
                top: 60,
                bottom: 160,
              ),
              child: Container(
                width: 352,
                height: 572,
                decoration: BoxDecoration(
                  color: MyColors.orangecolor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 55,
                    vertical: 64,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '''Hey!
Let’s Enjoy Some Cookin’''',
                        style: GoogleFonts.oswald(
                          color: MyColors.butterycolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Lottie.asset(
                          'assets/animations/lets_cook_animation.json'),
                      const Spacer(),
                      AnimatedButton(
                        pageController: pageController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
