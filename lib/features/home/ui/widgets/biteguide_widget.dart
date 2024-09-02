import 'package:cooking_app/core/common_widgets/button_widget.dart';
import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/ui/screens/login_page.dart';
import 'package:cooking_app/features/home/ui/screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BiteguideWidget extends StatelessWidget {
  const BiteguideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 137.h, right: 55.w, left: 55.w),
          child: Lottie.asset("assets/animations/5qdZDIR369.json",
              fit: BoxFit.cover, width: 321.w, height: 318.h),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.h, left: 125.w, right: 125.w),
          child: Text(
            "BiteGuide",
            style: MyTextStyle.biteguide,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 62.w, right: 62.w, top: 36.h),
          child: ButtonWidget(
            style: MyTextStyle.textButton,
            text: "LogIn",
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            width: 306.w,
            height: 55.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 128.w, right: 120.w, top: 8.h),
          child: Row(
            children: [
              Text(
                "Don’t have an account ?",
                style: MyTextStyle.haveAccount,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text(
                  "SignUp",
                  style: MyTextStyle.signUpButton,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
