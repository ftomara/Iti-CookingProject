import 'package:cooking_app/core/helper/navigation .dart';
import 'package:cooking_app/core/network/firebase/favourite.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/features/home/ui/screens/main_page.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'back_button_appbar.dart';

class FinishCookingScreen extends StatelessWidget {
  const FinishCookingScreen({super.key, this.recipe});
  final RecipeInfo? recipe;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const BackButtonAppbar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 356.w,
                      height: 500.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.orangecolor,
                          width: 4.w,
                        ),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.h,
                          vertical: 48.w,
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
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              ' Keep It Close for Next Time!',
                              style: GoogleFonts.oswald(
                                color: MyColors.greycolor,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Lottie.asset(
                              'assets/animations/rate_meal_animation.json',
                              height: 260.h,
                              width: 260.w,
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
                        if (recipe != null) {
                          FavouriteImp().addData(recipe!, context);
                        }

                        PushNavigation(context, const MainPage());
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
                        'Add To My Favorites!',
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
                            builder: (context) => const MainPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
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
