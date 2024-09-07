import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/features/home/ui/widgets/favorite_bar.dart';
import 'package:cooking_app/features/home/ui/widgets/favourite_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cooking_app/features/home/ui/widgets/nav_bar.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card_gen_fbs.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card_gen.dart';
import 'package:cooking_app/features/home/ui/widgets/search.dart';
import 'package:cooking_app/features/home/ui/widgets/welcoming_bar.dart';
import 'package:cooking_app/gen/assets.gen.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  Future<List<RecipeInfo>> _fetchFavoriteRecipes() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    print('Fetching favorites for user: $userId');

    final favoriteDocs = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('favourites')
        .get();

    print('Favorite documents: ${favoriteDocs.docs.length}');

    final recipes = favoriteDocs.docs.map((doc) {
      final recipeData = doc.data();
      print('Recipe data: $recipeData');
      return RecipeInfo.fromJson(recipeData);
    }).toList();

    print('Recipes parsed: ${recipes.length}');

    return recipes;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<RecipeInfo>>(
        future: _fetchFavoriteRecipes(),
        builder:
            (BuildContext context, AsyncSnapshot<List<RecipeInfo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child:  CircularProgressIndicator(
            color: MyColors.orangecolor,
          ),);
          }
          if (snapshot.hasError) {
            return Center(
                child: Text("Something went wrong: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No favorites found for this user'));
          }

          final favoriteRecipes = snapshot.data!;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.h),
            child: Column(children: [
              FavoriteBar(),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: favoriteRecipes.length,
                  itemBuilder: (context, index) {
                    print("name please ${favoriteRecipes[index].title}");
                    return FavouriteCard(result: favoriteRecipes[index]);
                  },
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
