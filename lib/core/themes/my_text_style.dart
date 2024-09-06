// ignore_for_file: non_constant_identifier_names

import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyle {
  static TextStyle hello = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.greycolor,
    ),
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static TextStyle input = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.hintColor,
    ),
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static TextStyle hellothin = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.greycolor,
    ),
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );

  static TextStyle category_not_selected = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.greycolor,
    ),
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static TextStyle category_selected = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.butterycolor,
    ),
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static TextStyle question = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.greycolor,
    ),
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );
  static TextStyle add_recipe = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.greycolor,
    ),
    fontSize: 30,
    fontWeight: FontWeight.w400,
  );
  static TextStyle search = GoogleFonts.oswald(
    textStyle: const TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.5),
    ),
    fontSize: 16,
    fontWeight: FontWeight.w200,
  );

  static TextStyle recipe_title = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.butterycolor,
    ),
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle recipe_author = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.greycolor2,
    ),
    fontSize: 9,
    fontWeight: FontWeight.w600,
  );
  static TextStyle recipe_time = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.butterycolor,
    ),
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  static TextStyle user_follower = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.butterycolor,
    ),
    fontSize: 10,
    fontWeight: FontWeight.w300,
  );
  static TextStyle user_follower16 = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.butterycolor,
    ),
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static TextStyle user_follower_number = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.butterycolor,
    ),
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  static TextStyle cook = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.orangecolor,
    ),
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle user_name = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.greycolor,
    ),
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  static TextStyle welcome = GoogleFonts.oswald(
      color: MyColors.greycolor, fontSize: 36.sp, fontWeight: FontWeight.w600);

  static TextStyle title = GoogleFonts.oswald(
      color: MyColors.orangecolor,
      fontSize: 24.sp,
      fontWeight: FontWeight.w300);

  static TextStyle textButton = GoogleFonts.oswald(
      color: MyColors.butterycolor,
      fontSize: 36.sp,
      fontWeight: FontWeight.w400);

  static TextStyle add_recipe_button = GoogleFonts.oswald(
    color: MyColors.butterycolor,
    fontWeight: FontWeight.normal,
    fontSize: 28,
  );

  static TextStyle biteguide = GoogleFonts.oswald(
      color: MyColors.black, fontSize: 50.sp, fontWeight: FontWeight.w400);

  static TextStyle haveAccount = GoogleFonts.oswald(
      color: MyColors.black, fontSize: 16.sp, fontWeight: FontWeight.w300);

  static TextStyle instructionsAndIngreadiants = GoogleFonts.oswald(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: MyColors.black,
  );

  static TextStyle serving = GoogleFonts.oswald(
    color: MyColors.black,
    fontSize: 18,
  );
  static TextStyle textfield = GoogleFonts.oswald(
      color: MyColors.black, fontSize: 24.sp, fontWeight: FontWeight.w300);
  static TextStyle signUpButton = GoogleFonts.oswald(
      color: MyColors.orangecolor,
      fontSize: 16.sp,
      decorationColor: MyColors.orangecolor,
      decorationThickness: 1.5,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w600);
}
