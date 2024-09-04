// ignore_for_file: unused_import

import 'package:cooking_app/features/home/ui/screens/favorite_page.dart';
import 'package:cooking_app/features/home/ui/screens/home_page.dart';
import 'package:cooking_app/features/home/ui/screens/upload_recipe_page.dart';
import 'package:cooking_app/features/home/ui/screens/user_profile_page.dart';
import 'package:cooking_app/features/home/ui/screens/users_page.dart';
import 'package:cooking_app/features/home/ui/screens/on_boarding_page.dart';
import 'package:cooking_app/features/home/ui/widgets/nav_bar.dart';
import 'package:cooking_app/my_colors.dart';
// import 'package:cooking_app/features/home/ui/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCookingApp extends StatefulWidget {
  const MyCookingApp({super.key});

  @override
  State<MyCookingApp> createState() => _MyCookingAppState();
}

class _MyCookingAppState extends State<MyCookingApp> {
  int _currentIndex = 0;

  final List<Widget> _Pages = [
    const HomePage(),
    const UsersPage(),
    const UploadRecipePage(),
    const FavoritePage(),
    const UserProfilePage(),
  ];

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
        home: SafeArea(
          child: Scaffold(
            backgroundColor: MyColors.butterycolor,
            body: _Pages[_currentIndex],
            bottomNavigationBar: NavBar(
              currentIndex: _currentIndex,
              onTap: _onNavBarTap,
            ),
          ),
        ),
      ),
    );
  }
}
