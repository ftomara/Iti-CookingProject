// ignore_for_file: unused_import

import 'package:cooking_app/core/di/module.dart';
import 'package:cooking_app/features/home/logic/id_recipe.dart';
import 'package:cooking_app/features/home/logic/item_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_info_cubit.dart';

import 'package:cooking_app/features/home/ui/screens/favorite_page.dart';
import 'package:cooking_app/features/home/ui/screens/home_page.dart';
import 'package:cooking_app/features/home/ui/screens/main_page.dart';
import 'package:cooking_app/features/home/ui/screens/upload_recipe_page.dart';
import 'package:cooking_app/features/home/ui/screens/user_profile_page.dart';
import 'package:cooking_app/features/home/ui/screens/users_page.dart';
import 'package:cooking_app/features/home/ui/screens/on_boarding_page.dart';
import 'package:cooking_app/features/home/ui/widgets/nav_bar.dart';
import 'package:cooking_app/my_colors.dart';
// import 'package:cooking_app/features/home/ui/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/model/recipe.dart';
import 'features/home/model/recipe_types.dart';
import 'features/home/model/time.dart';

class MyCookingApp extends StatefulWidget {
  const MyCookingApp({super.key});

  @override
  State<MyCookingApp> createState() => _MyCookingAppState();
}

class _MyCookingAppState extends State<MyCookingApp> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(),
      const UsersPage(),
      const UploadRecipePage(),
      const FavoritePage(),
      const UserProfilePage(),
    ];
  }

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
            // body: const UploadRecipePage(),
            body: _pages[_currentIndex],
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
