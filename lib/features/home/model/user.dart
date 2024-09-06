import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/features/home/model/recipe.dart';

class Userfbs {
  String userId = '';
  String? email = '';
  String? username = '';
  List<Recipe>? recipes = [];
  List<Recipe>? favorites = [];

  Userfbs(
      {required this.userId,
      this.email,
      this.username,
      this.favorites,
      this.recipes});
  factory Userfbs.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Userfbs(
      userId: data['userId'] ?? '',
      username: data['username'],
      recipes: (data['recipes'] as List<dynamic>?)
          ?.map((e) => Recipe.fromFirestore(e))
          .toList(),
      favorites: (data['favorites'] as List<dynamic>?)
          ?.map((e) => Recipe.fromFirestore(e))
          .toList(),
    );
  }

   Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'email': email,
      'username': username,
      'recipes': recipes?.map((e) => e.toFirestore()).toList(),
      'favorites': favorites?.map((e) => e.toFirestore()).toList(),
    };
  }

}
