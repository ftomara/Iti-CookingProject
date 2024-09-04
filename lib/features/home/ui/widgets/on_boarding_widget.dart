import 'package:cooking_app/core/common_widgets/button_widget.dart';
import 'package:cooking_app/core/helper/navigation%20.dart';
import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/ui/screens/BiteGuide_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 101.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Lottie.asset("assets/animations/DsaIGmBy0d.json",
                fit: BoxFit.cover, height: 420.h, width: 350.w),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 45.w,
              top: 25,
              right: 45.w,
            ),
            child: Text(
              "Welcome to BiteGuide",
              style: MyTextStyle.welcome,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 72.w),
            child: Text(
              "Where Every Recipe Feels Like Home",
              textAlign: TextAlign.center,
              style: MyTextStyle.title,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 33.75.h, left: 77.45.w, right: 77.45.w),
            child: ButtonWidget(
              style: MyTextStyle.textButton,
              width: 278.1.w,
              height: 49.5.h,
              text: "Get Started",
              onPress: () {
                PushNavigation(context, const BiteguidePage());
              },
            ),
          )
        ],
      ),
    );
  }
}
