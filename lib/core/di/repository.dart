import 'package:cooking_app/core/network/api/api_result.dart';
import 'package:cooking_app/core/network/api/api_service.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';

abstract class Repository {
  Future<ApiResult<RecipeApi>> getRecipeApi(String recipe);
}

class RepositoryImp extends Repository {
  ApiService api;
  RepositoryImp(this.api);
  @override
  Future<ApiResult<RecipeApi>> getRecipeApi(String recipe) {
    return api.getRecipe(recipe);
  }
}
