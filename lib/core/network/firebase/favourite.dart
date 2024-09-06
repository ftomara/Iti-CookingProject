import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/util/extentions/snackbar_extention.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class Favourite {
  void addData(RecipeInfo recipe, BuildContext context);
}

class FavouriteImp extends Favourite {
  final String id = FirebaseAuth.instance.currentUser?.uid ?? "";
  @override
  void addData(RecipeInfo recipe, BuildContext context) {
    CollectionReference favourite = FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("favourites");

    final recipeData = {
      "id": recipe.id,
      "title": recipe.title,
      "image": recipe.image,
    };

    favourite.add(recipeData).then((value) {
      context.snackbar("Added");
    }).catchError((error) {
      context.snackbar("Failed to add recipe: $error");
    });
  }
}
