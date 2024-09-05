import 'package:cooking_app/core/network/api/api_service.dart';
import 'package:cooking_app/core/network/api/dio_config.dart';
import 'package:cooking_app/features/home/logic/item_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_info_cubit.dart';
import 'package:cooking_app/features/home/logic/search_cubit.dart';
import 'package:cooking_app/features/home/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt get = GetIt.instance;

void setupDependinces() {
  get.registerFactory(() => ItemCubit());
  get.registerLazySingleton<Dio>(() => DioConfig.getDio());
  get.registerLazySingleton<ApiService>(() => ApiServiceImpl(get()));
  get.registerLazySingleton<Repository>(() => RepositoryImp(get()));
   get.registerLazySingleton<RecipeCubit>(() => RecipeCubit(get())); 
  get.registerLazySingleton<RecipeInfoCubit>(() => RecipeInfoCubit(get()));
}
