import 'package:cooking_app/core/network/api/api_result.dart';
import 'package:cooking_app/core/network/api/api_service.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';

abstract class Repository {
  Future<ApiResult<RecipeApi>> getRecipeCategory(String recipe);
  Future<ApiResult<RecipeApi>> getRecipeInfo(int id);
}

class RepositoryImp extends Repository {
  ApiService api;
  RepositoryImp(this.api);
  @override
  Future<ApiResult<RecipeApi>> getRecipeCategory(String recipe) {
    return api.getRecipeCategory(recipe);
  }

  @override
  Future<ApiResult<RecipeApi>> getRecipeInfo(int id) {
    return api.getInfo(id);
  }
}
