// ignore_for_file: unused_import

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/item_cubit.dart';
import 'package:cooking_app/features/home/ui/screens/home_page.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Catigories extends StatefulWidget {
  const Catigories({super.key});

  @override
  State<Catigories> createState() => _CatigoriesState();
}

class _CatigoriesState extends State<Catigories> {
  Radius radius = const Radius.circular(16);
  List<String> text = ['BreakFast', 'Lunch', 'Dinner', 'Dessert'];
  int _index = -1; // handle cubit state mangement

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          width: 8.w,
        ),
        _buildTab(text[0], 0),
        _buildTab(text[1], 1),
        _buildTab(text[2], 2),
        _buildTab(text[3], 3),
      ]),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = _index == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _index = index;
          context
              .read<ItemCubit>()
              .change(text[_index], ""); // Update the selected tab index
        });
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: isSelected ? 7.h : 21.h),
            height:
                isSelected ? 54.h : 40.h, // Adjust height based on selection
            width: 90.h,
            decoration: BoxDecoration(
              color: isSelected
                  ? MyColors.orangecolor
                  : MyColors.butterycolor, // Adjust color based on selection
              borderRadius: BorderRadius.only(
                topLeft: radius,
                topRight: radius,
              ),
              border: Border.all(color: Colors.black, width: 1.w),
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.grey.withOpacity(0.5), // Shadow color with opacity
                  spreadRadius: 2.r, // How much the shadow spreads
                  blurRadius: 4, // How much the shadow is blurred
                  offset: const Offset(0, 3), // Position of the shadow (x, y)
                ),
              ],
            ),
            child: Center(
              child: Text(
                title,
                style: isSelected
                    ? MyTextStyle
                        .category_selected // Adjust text style based on selection
                    : MyTextStyle.category_not_selected,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
