import 'package:cooking_app/features/home/ui/screens/home_page.dart';
import 'package:cooking_app/my_colors.dart';
// import 'package:cooking_app/features/home/ui/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCookingApp extends StatelessWidget {
  const MyCookingApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.butterycolor),
        useMaterial3: true,
      ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}