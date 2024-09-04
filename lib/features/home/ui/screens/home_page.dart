// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cooking_app/features/home/ui/widgets/catigories.dart';
import 'package:cooking_app/features/home/ui/widgets/nav_bar.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card_gen.dart';
import 'package:cooking_app/features/home/ui/widgets/search.dart';
import 'package:cooking_app/features/home/ui/widgets/welcoming_bar.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/recipe.dart';
import '../../model/recipe_types.dart';
import '../../model/time.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          const WelcomingBar(),
          const Search(),
          Catigories(),
          Expanded(
              child: RecipeCardGen(
            recipeList: recipes,
          )),
          // SizedBox(height:500,),
        ],
      ),
    );
  }
}
