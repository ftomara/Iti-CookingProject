import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Initialize Firebase Storage
class FirebaseService<T> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<void> addUser(Userfbs user) async {
    var collection = _db.collection('users');
    await collection.doc(user.userId).set(user.toFirestore());
  }

  Future<Userfbs> getUser(String userId) async {
    try {
      var user = await _db.collection('users').doc(userId).get();
      if (user.exists) {
        return Userfbs.fromFirestore(user);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      print("Error getting user: $e");
      throw e;
    }
  }

  Future<List<Userfbs>> getUserss() async {
    try {
      final users = await _db.collection('users').get();
      return users.docs.map((doc) => Userfbs.fromFirestore(doc)).toList();
    } catch (e) {
      print("Error fetching users: $e");
      return [];
    }
  }

  Future<List<Recipe>> getRecipes(String userId) async {
    try {
      final recipes =
          await _db.collection('users').doc(userId).collection('recipes').get();

      if (recipes.docs.isEmpty) {
        print("No recipes found for user $userId.");
        return [];
      }

      print("Fetched ${recipes.docs.length} recipes.");
      return recipes.docs.map((doc) {
        // print("Mapping document: ${doc.data()}");
        return Recipe.fromFirestore(doc);
      }).toList();
    } catch (e) {
      print("Error fetching recipes: $e");
      return [];
    }
  }

  Future<Recipe?> getRecipe(String userId, String recipetitle) async {
    try {
      final recipe = await _db
          .collection('users')
          .doc(userId)
          .collection('recipes')
          .where('title', isEqualTo: recipetitle)
          .limit(1)
          .get();
      if (recipe.docs.isNotEmpty) {
        final documentSnapshot = recipe.docs.first;

        return Recipe.fromFirestore(documentSnapshot);
      } else {
        print("No recipe found with title: $recipetitle");
        return null;
      }
    } catch (e) {
      print("Error fetching recipe: $e");
      return null;
    }
  }

  Future<void> addRecipe(Recipe recipe, String userId) async {
    try {
      if (recipe.impPath != null) {
        Reference ref =
            _storage.ref().child('recipe_images/${recipe.title}.png');
        await ref.putFile(File(recipe.impPath!));
        final downloadUrl = await ref.getDownloadURL();
        recipe.setUrl = downloadUrl;
        print('Recipe image uploaded successfully, URL: $downloadUrl');
      } else {
        print('Error uploading image');
      }
      await _db
          .collection('users')
          .doc(userId)
          .collection('recipes')
          .add(recipe.toFirestore());
      print('Recipe added to Firestore successfully.');
      await _db.collection('users').doc(userId).update({
        'recipeslength': FieldValue.increment(1),
      });
      print('User recipe count updated.');
    } catch (e) {
      print("Error adding recipe: $e");
    }
  }

  // Future<void> uploadimage(Recipe recipe, String userId) async {
  //   try {
  //     if (recipe.impPath != null) {
  //       Reference ref =
  //           _storage.ref().child('recipe_images/${recipe.title}.png');
  //       await ref.putFile(File(recipe.impPath!));
  //       final downloadUrl = await ref.getDownloadURL();
  //       print('Recipe image uploaded successfully, URL: $downloadUrl');
  //     } else {
  //       print('Error uploading image');
  //     }
  //   } catch (e) {
  //     print("Error uplaoding recipe: $e");
  //   }
  // }
}
