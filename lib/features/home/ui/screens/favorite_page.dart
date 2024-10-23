import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/features/home/ui/widgets/favorite_bar.dart';
import 'package:cooking_app/features/home/ui/widgets/favourite_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  Stream<List<RecipeInfo>> _fetchFavoriteRecipesStream() {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('favourites')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final recipeData = doc.data();
        return RecipeInfo.fromJson(recipeData);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<List<RecipeInfo>>(
        stream: _fetchFavoriteRecipesStream(),
        builder:
            (BuildContext context, AsyncSnapshot<List<RecipeInfo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
                child: Text("Something went wrong: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No favorites found for this user'));
          }

          final favoriteRecipes = snapshot.data!;

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.h),
              child: Column(
                children: [
                  const FavoriteBar(),
                  SizedBox(
                    height: 12.h,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: favoriteRecipes.length,
                      itemBuilder: (context, index) {
                        return FavouriteCard(result: favoriteRecipes[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
