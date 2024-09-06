import 'package:cooking_app/core/network/api/api_result.dart';
import 'package:cooking_app/core/network/api/api_service.dart';
import 'package:cooking_app/core/network/firebase/firebase_services.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';
import 'package:cooking_app/features/home/model/user.dart';

abstract class Repository {
  Future<ApiResult<RecipeApi>> getRecipeApi(String recipe);
}

class RepositoryImp extends Repository {
  ApiService api;
  FirebaseService fbs;
  RepositoryImp(this.api, this.fbs);
  @override
  Future<ApiResult<RecipeApi>> getRecipeApi(String recipe) {
    return api.getRecipe(recipe);
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

  Future<Userfbs?> getuser(String userId) async {
    return fbs.getUser(userId);
  }

  Future<List<Userfbs>?> getusers() async {
    return fbs.getUserss();
  }
  Future<void> adduser(Userfbs user)async
  {
    fbs.addUser(user);
  }
}
