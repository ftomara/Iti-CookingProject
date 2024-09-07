import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService<T> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
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
      // Check if the query returned any documents
      if (recipe.docs.isNotEmpty) {
        // Get the first document from the query result
        final documentSnapshot = recipe.docs.first;

        // Convert the document snapshot to a Recipe object
        return Recipe.fromFirestore(documentSnapshot);
      } else {
        // Handle case where no recipes are found
        print("No recipe found with title: $recipetitle");
        return null;
      }
    } catch (e) {
      // Handle any errors that occur
      print("Error fetching recipe: $e");
      return null; // Alternatively, you could rethrow the error if needed
    }
  }

  Future<void> addRecipe(Recipe recipe, String userId) async {
    try {
      await _db
          .collection('users')
          .doc(userId)
          .collection('recipes')
          .add(recipe.toFirestore());
      await _db.collection('users').doc(userId).update({
        'recipeslength': FieldValue.increment(1),
      });
    } catch (e) {
      print("Error adding recipe: $e");
    }
  }
}
