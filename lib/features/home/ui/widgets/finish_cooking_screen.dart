import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../my_cooking_app.dart';
import 'back_button_appbar.dart';
import 'rating_stars.dart';

class FinishCookingScreen extends StatelessWidget {
  const FinishCookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const BackButtonAppbar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 352,
                      height: 480,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.orangecolor,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 64,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Enjoyed Your Meal?',
                              style: GoogleFonts.oswald(
                                color: MyColors.orangecolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              ' Keep It Close for Next Time!',
                              style: GoogleFonts.oswald(
                                color: MyColors.greycolor,
                                fontWeight: FontWeight.normal,
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.center,
                            ),
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
                        'Add To My Favoraites!',
                        style: GoogleFonts.oswald(
                          color: MyColors.butterycolor,
                          fontWeight: FontWeight.normal,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
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
                        // backgroundColor: MyColors.orangecolor,

                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: MyColors.orangecolor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'Maybe later',
                        style: GoogleFonts.oswald(
                          color: MyColors.orangecolor,
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
      ),
    );
  }
}