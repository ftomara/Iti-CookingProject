// ignore_for_file: unused_import

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:flutter/material.dart';

class WelcomingBar extends StatelessWidget {
  const WelcomingBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const SizedBox(width: 24,),
          CircleAvatar(
            radius: 30,
            backgroundColor: MyColors.orangecolor,
          ),
          const SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text('Hello , Sherly!' , style: MyTextStyle.hello,),
              Text('What do you Want to Eat Today ?' , style: MyTextStyle.question,overflow: TextOverflow.ellipsis)
              
              ],
          ),
          const SizedBox(width: 16,),
        ],
      
    );
  }
}
