// ignore_for_file: unused_import, prefer_const_constructors

import 'package:cooking_app/features/home/ui/widgets/catigories.dart';
import 'package:cooking_app/features/home/ui/widgets/favorite_bar.dart';
import 'package:cooking_app/features/home/ui/widgets/nav_bar.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card_gen.dart';
import 'package:cooking_app/features/home/ui/widgets/search.dart';
import 'package:cooking_app/features/home/ui/widgets/welcoming_bar.dart';
import 'package:cooking_app/gen/assets.gen.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.butterycolor,
      body: const Padding(
        padding: EdgeInsets.only(top: 36 ),
        child: Column(
          children: [
            FavoriteBar(),
            Expanded(child: RecipeCardGen()),
            // SizedBox(height:500,),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
