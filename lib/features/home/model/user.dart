import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/features/home/model/recipe.dart';

class Userfbs {
  String userId = '';
  String? email = '';
  String? username = '';
  List<Recipe>? recipes = [];
  int? recipeslength = 0;
  List<Recipe>? favorites = [];
  String imageUrl;
  set setUrl(String url) {
    imageUrl = url;
  }
  Userfbs(
      {required this.userId,
      this.email,
      this.username,
      this.favorites,
      this.recipeslength = 0,
      this.recipes, this.imageUrl =''});

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
      recipeslength: data['recipeslength'] ?? 0,
      imageUrl : data['imageUrl']??'',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'email': email,
      'username': username,
      'recipes': recipes?.map((e) => e.toFirestore()).toList(),
      'favorites': favorites?.map((e) => e.toFirestore()).toList(),
      'recipeslength': recipeslength,
      'imageURl' :imageUrl,
    };
  }
}
