import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../my_cooking_app.dart';
import 'back_button_appbar.dart';
import 'rating_stars.dart';

class RateMealScreen extends StatelessWidget {
  const RateMealScreen({super.key});

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
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 352,
                    height: 572,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: MyColors.orangecolor,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 52,
                        vertical: 64,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Did you Enjoy Your Meal?',
                            style: GoogleFonts.oswald(
                              color: MyColors.orangecolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          const RatingStars(),
                          const Spacer(),
                          Lottie.asset(
                            'assets/animations/rate_meal_animation.json',
                            height: 260,
                            width: 260,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyCookingApp(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.orangecolor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Thank You',
                      style: GoogleFonts.oswald(
                        color: MyColors.butterycolor,
                        fontWeight: FontWeight.normal,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
