// ignore_for_file: prefer_const_constructors

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/gen/assets.gen.dart';
import 'package:cooking_app/my_colors.dart';
// ignore: unused_import
import 'package:cooking_app/my_cooking_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({super.key});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h,),
        Container(
          margin: EdgeInsets.only( left: 36, right: 36, bottom: 4),
          height: 157.h,
          width: 335.w,
          decoration: BoxDecoration(
              color: MyColors.orangecolor, borderRadius: BorderRadius.circular(16)),
          child: Stack(children: [
            Positioned(
                left: 20,
                top: 20,
                child: Image.asset(
                  'assets/images/dummy_recipe.png',
                  width: 90,
                  height: 90,
                )),
            Positioned(
                left: 250,
                top: 2,
                child: IconButton(
                  onPressed: () {
                      setState(() {
                        liked = !liked;
                      });
                  },
                  icon: SvgPicture.asset(
                    liked? const $AssetsImagesGen().filledHeart : const $AssetsImagesGen().heart ,
                    colorFilter: ColorFilter.mode(
                    liked==false ? MyColors.butterycolor:MyColors.butterycolor,
                    BlendMode.srcIn,
                  ) ,
                    width: 20, // Adjust width as needed
                    height: 20, // Adjust height as needed
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 42.w,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Baked Egg Boats',
                    style: MyTextStyle.recipe_title,
                  ),
                  Text(
                    'By Mady',
                    style: MyTextStyle.recipe_author,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            const $AssetsImagesGen().timer,
                            width: 12, // Adjust width as needed
                            height: 12, // Adjust height as needed
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            '20 Mins',
                            style: MyTextStyle.recipe_time,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          SvgPicture.asset(
                            const $AssetsImagesGen().calories,
                            width: 12, // Adjust width as needed
                            height: 12, // Adjust height as needed
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            '20 Mins',
                            style: MyTextStyle.recipe_time,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                      children: List.generate(5, (index) {
                    return SvgPicture.asset(
                      const $AssetsImagesGen().filledStar,
                      width: 12, // Adjust width as needed
                      height: 12, // Adjust height as needed
                    );
                  })),
                ])
              ],
            ),
            Positioned(
                left: 190,
                top: 100,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 108.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: MyColors.butterycolor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 40, 40, 40)
                              .withOpacity(0.5), // Shadow color with opacity
                          spreadRadius: 0, // How much the shadow spreads
                          blurRadius: 2, // How much the shadow is blurred
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Center(
                        child: Text(
                      "Cook",
                      style: MyTextStyle.cook,
                    )),
                  ),
                )),
          ]),
        ),
      ],
    );
  }
}
