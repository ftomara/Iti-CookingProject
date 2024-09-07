// ignore_for_file: unused_import

import 'package:cooking_app/core/di/module.dart';
import 'package:cooking_app/core/helper/navigation%20.dart';
import 'package:cooking_app/core/network/firebase/authenticate%20.dart';
import 'package:cooking_app/features/home/logic/Recipe_Type_cubit.dart';
import 'package:cooking_app/features/home/logic/id_recipe.dart';
import 'package:cooking_app/features/home/logic/image_cubit.dart';
import 'package:cooking_app/features/home/logic/item_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_info_cubit.dart';
// import 'package:cooking_app/features/home/logic/search_cubit.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/user_cubit.dart';
import 'package:cooking_app/features/home/logic/user_info_cubit.dart';
import 'package:cooking_app/features/home/ui/screens/favorite_page.dart';
import 'package:cooking_app/features/home/ui/screens/home_page.dart';
import 'package:cooking_app/features/home/ui/screens/login_page.dart';
import 'package:cooking_app/features/home/ui/screens/sign_up_page.dart';
import 'package:cooking_app/features/home/ui/screens/upload_recipe_page.dart';
import 'package:cooking_app/features/home/ui/screens/user_profile_page.dart';
import 'package:cooking_app/features/home/ui/screens/users_page.dart';
import 'package:cooking_app/features/home/ui/screens/on_boarding_page.dart';
import 'package:cooking_app/features/home/ui/widgets/nav_bar.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:cooking_app/my_cooking_app.dart';
// import 'package:cooking_app/features/home/ui/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/model/recipe.dart';
import 'features/home/model/recipe_types.dart';
import 'features/home/model/time.dart';

class Checkuser extends StatefulWidget {
  const Checkuser({super.key});

  @override
  State<Checkuser> createState() => _CheckuserState();
}

class _CheckuserState extends State<Checkuser> {
  late Future<bool> loggedFuture;

  @override
  void initState() {
    super.initState();
    // loggedFuture = AuthenticateImpl().checkUserAuthentication(context);
    loggedFuture =
        AuthenticateImpl(get<UserCubit>()).checkUserAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ItemCubit>(
          create: (context) => ItemCubit(),
        ),
        BlocProvider<RecipeCubit>(
          create: (context) => get<RecipeCubit>(),
        ),
        // BlocProvider<SearchCubit>(
        //   create: (context) => get<SearchCubit>(),
        // ),
        // BlocProvider<UserCubit>(
        //   create: (context) => UserCubit(),
        // ),
        BlocProvider<IdRecipe>(
          create: (context) => IdRecipe(),
        ),
        BlocProvider<RecipeInfoCubit>(
          create: (context) => get<RecipeInfoCubit>(),
        ),
        BlocProvider<ItemCubit>(
          create: (context) => ItemCubit(),
        ),
        BlocProvider<RecipeCubit>(
          create: (context) => get<RecipeCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => get<UserCubit>(), // Use get<UserCubit>()
        ),
         BlocProvider<ImageCubit>(
          create: (context) => ImageCubit(), // Use get<UserCubit>()
        ),
          BlocProvider<RecipeTypeCubit>(
          create: (context) => RecipeTypeCubit(), // Use get<UserCubit>()
        ),
        BlocProvider<UploadRecipeCubit>(
            create: (context) => get<UploadRecipeCubit>()),
        BlocProvider<UserInfoCubit>(create: (context) => get<UserInfoCubit>()),
      ],
      child: ScreenUtilInit(
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
          home: FutureBuilder<bool>(
            future: loggedFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                bool isLoggedIn = snapshot.data ?? false;
                if (isLoggedIn) {
                  return const MyCookingApp();
                } else {
                  return const OnBoardingPage();
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
