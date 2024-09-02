import 'package:cooking_app/features/home/ui/screens/on_boarding_page.dart';
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
  static TextStyle search = GoogleFonts.oswald(
    textStyle: const TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.5),
    ),
    fontSize: 16,
    fontWeight: FontWeight.w200,
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

  static TextStyle biteguide = GoogleFonts.oswald(
      color: MyColors.black, fontSize: 50.sp, fontWeight: FontWeight.w400);

  static TextStyle haveAccount = GoogleFonts.oswald(
      color: MyColors.black, fontSize: 16.sp, fontWeight: FontWeight.w300);

  static TextStyle signUpButton = GoogleFonts.oswald(
      color: MyColors.orangecolor,
      fontSize: 16.sp,
      decorationColor: MyColors.orangecolor,
      decorationThickness: 1.5,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w600);
}
