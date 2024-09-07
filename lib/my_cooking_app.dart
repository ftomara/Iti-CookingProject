// ignore_for_file: unused_import

import 'package:cooking_app/core/di/module.dart';
import 'package:cooking_app/features/home/logic/id_recipe.dart';
import 'package:cooking_app/features/home/logic/item_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_info_cubit.dart';

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

  List<Recipe> recipes = [
    Recipe(
      title: 'Spicy Ramen Noodles',
      // chef: 'Mady Miller',
      // rate: 2,
      // calories: 602,
      ingreadiants: [
        '1 tbsp Garlic',
        '1 Green onion',
        '1.5 tbsp Peanuts, dry roasted',
        '3 tbsp Chili',
        '1 tbsp Peanut butter',
        '2 tsp Soy sauce',
        '1 package Ramen noodles, instant',
        '1 tsp Sugar',
        '1 tbsp Rice wine vinegar',
        '2 tbsp Water',
      ],
      instructions: [
        'Cook noodles in boiling water according to pack directions. Drain, rinse in colander under cool water and set aside.',
        'In a mixing bowl whisk together chili crisp, water, peanut butter, mirin, soy sauce, sugar, and garlic. Set aside.',
        'Add noodles to mixing bowl and toss together with sauce until evenly coated.',
        'Transfer noodles to a serving bowl and top with crushed peanuts, green onions and more chili crisp.',
      ],
      type: RecipeTypes.lunch,
      impPath: 'assets/images/ramen_dummy.png',
      // time: const Time(hours: 0, min: 20),
    ),
    Recipe(
      title: 'Pancakes',
      // chef: 'Chef John',
      // rate: 3,
      // calories: 200.0,
      ingreadiants: [
        'Flour',
        'Milk',
        'Eggs',
        'Sugar',
        'Butter',
      ],
      instructions: [
        'Mix ingredients',
        'Cook on stove',
        'Serve hot',
      ],
      type: RecipeTypes.breakfast,
      impPath: 'assets/images/pancakes_dummy.png',
      // time: const Time(hours: 0, min: 25),
    ),
    Recipe(
      title: 'Spaghetti Bolognese',
      // // chef: 'Chef Anna',
      // rate: 4,
      // calories: 450.0,
      ingreadiants: [
        'Pasta',
        'Tomato Sauce',
        'Ground Beef',
        'Garlic',
        'Olive Oil',
      ],
      instructions: [
        'Boil pasta',
        'Cook sauce',
        'Combine and serve',
      ],
      type: RecipeTypes.lunch,
      impPath: 'assets/images/spaghetti_dummy.png',
      // time: const Time(hours: 1, min: 30),
    ),
    Recipe(
      title: 'Caesar Salad',
      // // chef: 'Chef Emma',
      // rate: 5,
      // calories: 150.0,
      ingreadiants: [
        'Romaine lettuce',
        'Croutons',
        'Parmesan cheese',
        'Caesar dressing',
        'Grilled chicken (optional)',
      ],
      instructions: [
        'Chop the romaine lettuce.',
        'Add croutons and grated Parmesan cheese.',
        'Drizzle Caesar dressing over the salad.',
        'Toss to combine.',
        'Top with grilled chicken if desired.',
      ],
      type: RecipeTypes.dinner,
      impPath: 'assets/images/caesar_salad_dummy.png',
      // time: const Time(hours: 0, min: 15),
    ),
    Recipe(
      title: 'Chocolate Cake',
      // // chef: 'Chef Sophia',
      // rate: 5,
      // calories: 400.0,
      ingreadiants: [
        'Flour',
        'Cocoa powder',
        'Baking powder',
        'Sugar',
        'Eggs',
        'Butter',
        'Vanilla extract',
        'Milk',
      ],
      instructions: [
        'Preheat the oven to 350°F (175°C).',
        'Grease and flour a cake pan.',
        'Mix dry ingredients in a bowl.',
        'Add wet ingredients and mix until smooth.',
        'Pour the batter into the prepared pan.',
        'Bake for 30-35 minutes or until a toothpick inserted into the center comes out clean.',
        'Let the cake cool before frosting.',
      ],
      type: RecipeTypes.dessert,
      impPath: 'assets/images/chocolate_cake_dummy.png',
      // time: const Time(hours: 0, min: 45),
      servings: 6,
    ),
    Recipe(
      title: 'Grilled Salmon',
      // // chef: 'Chef Liam',
      // rate: 4,
      // calories: 300.0,
      ingreadiants: [
        'Salmon fillets',
        'Olive oil',
        'Lemon juice',
        'Garlic',
        'Salt',
        'Pepper',
      ],
      instructions: [
        'Preheat the grill to medium-high heat.',
        'Brush salmon fillets with olive oil and lemon juice.',
        'Season with minced garlic, salt, and pepper.',
        'Grill the salmon for 4-5 minutes per side or until fully cooked.',
        'Serve with your choice of sides.',
      ],
      type: RecipeTypes.dinner,
      impPath: 'assets/images/grilled_salmon_dummy.png',
      // time: const Time(hours: 0, min: 20),
    ),
  ];

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(
          //  recipes: recipes,
          ),
      const UsersPage(),
      const UploadRecipePage(),
      FavoritePage(
        recipes: recipes,
      ),
      UserProfilePage(
        recipes: recipes,
      ),
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
