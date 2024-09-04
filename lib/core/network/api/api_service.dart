import 'package:cooking_app/core/network/api/api_exception.dart';
import 'package:cooking_app/core/network/api/api_result.dart';
import 'package:cooking_app/core/network/api/constant.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';
import 'package:dio/dio.dart';

abstract class ApiService {
  Future<ApiResult<RecipeApi>> getRecipe(String recipe);
}

class ApiServiceImpl extends ApiService {
  Dio dio;
  ApiServiceImpl(this.dio);
  @override
  Future<ApiResult<RecipeApi>> getRecipe(String recipe) async {
    Response response =
        await dio.get("${recipe}&${apiId}&${apiKey}&from=0&to=20");

    if (response.statusCode == 200) {
      return ApiResult.success(RecipeApi.fromJson(response.data));
    } else {
      return ApiResult.failure(ApiException.fromJson(response.data));
    }
  }
}
