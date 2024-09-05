import 'package:cooking_app/core/network/api/api_exception.dart';
import 'package:cooking_app/core/network/api/api_result.dart';
import 'package:cooking_app/core/network/api/constant.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';
import 'package:dio/dio.dart';

abstract class ApiService {
  Future<ApiResult<RecipeApi>> getRecipeCategory(String recipe);
    Future<ApiResult<RecipeApi>> getInfo(int id);
}

class ApiServiceImpl extends ApiService {
  Dio dio;
  ApiServiceImpl(this.dio);
  @override
  Future<ApiResult<RecipeApi>> getRecipeCategory(String recipe) async {
    Response response =
        await dio.get("${endpoint1}$recipe&${apiKey}&number=20");

    if (response.statusCode == 200) {
      return ApiResult.success(RecipeApi.fromJson(response.data));
    } else {
      return ApiResult.failure(ApiException.fromJson(response.data));
    }
  }
  
  @override
  Future<ApiResult<RecipeApi>> getInfo(int id)async {
    Response response =//660185/information?apiKey=f874544e654a4496b23785ff91bc26dd
        await dio.get("${id}$endpoint2${apiKey}");

    if (response.statusCode == 200) {
      return ApiResult.success(RecipeApi.fromJson(response.data));
    } else {
      return ApiResult.failure(ApiException.fromJson(response.data));
    }
  }
}
