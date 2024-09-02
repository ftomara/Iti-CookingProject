import 'package:cooking_app/features/home/ui/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCookingApp extends StatelessWidget {
  const MyCookingApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      child: MaterialApp(
        home: OnBoarding(),
      ),
    );
  }
}