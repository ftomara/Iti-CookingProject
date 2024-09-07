import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/util/extentions/snackbar_extention.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class Favourite {
  void addData(RecipeInfo recipe, BuildContext context);
  void removeFromUI(RecipeInfo recipe, BuildContext context);
}

class FavouriteImp extends Favourite {
  final String id = FirebaseAuth.instance.currentUser?.uid ?? "";

  @override
  void addData(RecipeInfo recipe, BuildContext context) async {
    CollectionReference favourite = FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("favourites");

    try {
      QuerySnapshot query =
          await favourite.where("id", isEqualTo: recipe.id).get();

      if (query.docs.isEmpty) {
        final recipeData = {
          "id": recipe.id,
          "title": recipe.title,
          "image": recipe.image,
        };

        await favourite.add(recipeData);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.snackbar("Added");
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.snackbar("Recipe is already in favorites!");
        });
      }
    } catch (error) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.snackbar("Failed to add recipe: $error");
      });
    }
  }

  @override
  void removeFromUI(RecipeInfo recipe, BuildContext context) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final delete = FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("favourites");

    QuerySnapshot query = await delete.where("id", isEqualTo: recipe.id).get();

    if (query.docs.isNotEmpty) {
      await query.docs.first.reference.delete();
    }
  }
}
