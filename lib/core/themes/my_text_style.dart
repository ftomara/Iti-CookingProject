// ignore_for_file: non_constant_identifier_names

import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyle {
  static TextStyle hello = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.greycolor,
    ),
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
   static TextStyle hellothin = GoogleFonts.oswald(
    textStyle: TextStyle(
      color: MyColors.greycolor,
    ),
    fontSize: 18,
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




}
