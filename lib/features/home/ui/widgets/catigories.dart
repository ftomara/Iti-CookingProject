import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';

class Catigories extends StatefulWidget {
  Catigories({super.key});

  @override
  State<Catigories> createState() => _CatigoriesState();
}

class _CatigoriesState extends State<Catigories> {
  Radius radius = const Radius.circular(16);
  bool is_selected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8,
          ),
          
          _buildTab('BreakFast'),
          _buildTab('Lunch'),
          _buildTab('Dinner'),
          _buildTab('Dessert'),
        ],
      ),
    );
  }

  Widget _buildTab(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          is_selected = !is_selected;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 21),
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: MyColors.butterycolor,
          borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
          border: const Border(
            top: BorderSide(width: 1),
            bottom: BorderSide(width: 1),
            left: BorderSide(width: 1),
            right: BorderSide(width: 1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 4, // How much the shadow is blurred
              offset: const Offset(0, 3), // Position of the shadow (x, y)
            ),
          ],
        ),
        child: Center(
            child: Text(
          title,
          style: MyTextStyle.category_not_selected,
        )),
      ),
    );
  }
}
