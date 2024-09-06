import 'package:cooking_app/core/network/api/api_result.dart';
import 'package:cooking_app/core/network/api/api_service.dart';
import 'package:cooking_app/core/network/firebase/firebase_services.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';

abstract class Repository {
  Future<ApiResult<RecipeApi>> getRecipeApi(String recipe);
  Future<void> uploadRecipe(Recipe recipe, String userId);
  Future<List<Recipe>> getRecipes(String userId);
  Future<Recipe?> getRecipe(String userId, String recipetitle);
  Future<Userfbs?> getuser(String userId);
  Future<List<Userfbs>?> getusers();
   Future<void> adduser(Userfbs user);
  Future<ApiResult<RecipeApi>> getRecipeCategory(String recipe);
  Future<ApiResult<RecipeInfo>> getRecipeInfo(int id);
}

class RepositoryImp extends Repository {
  ApiService api;
  FirebaseService fbs;
  RepositoryImp(this.api, this.fbs);
  @override
  Future<ApiResult<RecipeApi>> getRecipeCategory(String recipe) {
    return api.getRecipeCategory(recipe);
  }

  @override
  Future<ApiResult<RecipeInfo>> getRecipeInfo(int id) {
    return api.getInfo(id);
  }

  Future<void> uploadRecipe(Recipe recipe, String userId) async {
    fbs.addRecipe(recipe, userId);
  }

  Future<List<Recipe>> getRecipes(String userId) async {
    return fbs.getRecipes(userId);
  }

  Future<Recipe?> getRecipe(String userId, String recipetitle) async {
    return fbs.getRecipe(userId, recipetitle);
  }

  Future<Userfbs> getuser(String userId) async {
    return fbs.getUser(userId);
  }

  Future<List<Userfbs>?> getusers() async {
    return fbs.getUserss();
  }
  Future<void> adduser(Userfbs user)async
  {
    fbs.addUser(user);
  }
  
  @override
  Future<ApiResult<RecipeApi>> getRecipeApi(String recipe) {
    // TODO: implement getRecipeApi
    throw UnimplementedError();
  }
}
