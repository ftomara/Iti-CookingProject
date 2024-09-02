import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/gen/assets.gen.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 30, right: 30),
      height: 54,
      width: 368,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: MyColors.butterycolor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 4, // How much the shadow is blurred
            offset: const Offset(0, 3), // Position of the shadow (x, y)
          ),
        ],
      ),
      child: Form(
        
          child: TextFormField(
            
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: MyTextStyle.search,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SvgPicture.asset(
            const $AssetsImagesGen().searchicon,
            height: 16,
            width: 16,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(16.0), // Adjust the radius as needed
          borderSide: BorderSide(
            color: MyColors.greycolor, // Border color
            width: 2.0, // Border width
          ),
        ),
      ))),
    );
  }
}
