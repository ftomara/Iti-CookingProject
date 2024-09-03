// ignore_for_file: unused_import

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileAppbar extends StatelessWidget {
  const UserProfileAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
           SizedBox(width: 18.w,),
           Icon(Icons.arrow_back, color: MyColors.greycolor,),
           SizedBox(width: 18.w,),
           Text('Mady' , style: MyTextStyle.user_name,),
        ],
        
      );
  }
}
// backgroundColor: MyColors.butterycolor,
//         title: Text('Mady' , style: MyTextStyle.user_name,),
//         leading: Icon(Icons.arrow_back, color: MyColors.greycolor,),