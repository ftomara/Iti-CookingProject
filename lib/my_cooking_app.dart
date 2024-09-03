// ignore_for_file: unused_import

import 'package:cooking_app/features/home/ui/screens/favorite_page.dart';
import 'package:cooking_app/features/home/ui/screens/home_page.dart';
<<<<<<< HEAD
import 'package:cooking_app/features/home/ui/screens/user_profile_page.dart';
import 'package:cooking_app/features/home/ui/screens/users_page.dart';
=======
import 'package:cooking_app/features/home/ui/screens/on_boarding_page.dart';
>>>>>>> abc09e40b116c429f895080e61da136db7ffca11
import 'package:cooking_app/my_colors.dart';
// import 'package:cooking_app/features/home/ui/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCookingApp extends StatelessWidget {
  const MyCookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: MyColors.butterycolor,
          colorScheme: ColorScheme.fromSeed(seedColor: MyColors.butterycolor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const UserProfilePage(),
        // home: const OnBoardingPage(),
      ),
    );
  }
}
