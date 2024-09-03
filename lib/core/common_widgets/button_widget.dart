import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onPress;
  final TextStyle style;
  const ButtonWidget(
      {super.key,
      
      required this.style,
      required this.text,
      required this.onPress,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: MyColors.orangecolor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: MyColors.shadowColor,
            blurRadius: 3.6,
            spreadRadius: 0,
            offset: Offset(0, 3.6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPress,
        child: Center(
          child: Text(
            "${this.text}",
            style:style,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          fixedSize: Size(width, height),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
