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
}
