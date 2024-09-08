// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/model/user.dart';
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
      rethrow;
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
      // Upload recipe to Firestore first
      DocumentReference recipeRef = await _db
          .collection('users')
          .doc(userId)
          .collection('recipes')
          .add(recipe.toFirestore());

      print('Recipe added to Firestore successfully.');

      // Now handle image upload
      if (recipe.impPath != null) {
        try {
          Reference ref = _storage
              .ref()
              .child('recipe_images/${_sanitizeTitle(recipe.title)}.png');
          await ref.putFile(File(recipe.impPath!));
          final downloadUrl = await ref.getDownloadURL();
          recipe.setUrl = downloadUrl;

          // Update Firestore with the image URL
          await recipeRef.update({'imageUrl': downloadUrl});
          print('Recipe image uploaded successfully, URL: $downloadUrl');
        } catch (e) {
          print('Error uploading image: $e');
        }
      }

      // Increment the user's recipe count
      await _db.collection('users').doc(userId).update({
        'recipeslength': FieldValue.increment(1),
      });
      print('User recipe count updated.');
    } catch (e) {
      print("Error adding recipe: $e");
    }
  }

// Utility function to sanitize file paths
  String _sanitizeTitle(String title) {
    return title.replaceAll(
        RegExp(r'[^\w\s-]'), ''); // Removes special characters
  }

  Future<void> uploadimage(String? userId, String url) async {
    try {
      if (userId == null || userId.isEmpty) {
        print('Error: userId is null or empty');
        return;
      }

      Reference ref =
          _storage.ref().child('users_images/${_sanitizeTitle(userId)}.png');
      await ref.putFile(File(url));
      final downloadUrl = await ref.getDownloadURL();
      await _db.collection('users').doc(userId).update({
        'imageUrl': downloadUrl,
      });
      print('User image uploaded successfully, URL: $downloadUrl');
    } catch (e) {
      print('Error uploading user image: $e');
    }
  }

  // Increment the user's recipe count
}
