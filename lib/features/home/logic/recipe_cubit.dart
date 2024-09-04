import 'package:bloc/bloc.dart';
import 'package:cooking_app/core/network/api/api_result.dart';
import 'package:cooking_app/features/home/logic/recipe_state.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';
import 'package:cooking_app/features/home/repository/repository.dart';

class RecipeCubit extends Cubit<RecipeState> {
  Repository repo;

  RecipeCubit(this.repo) : super(RecipeState.intial());
  void emitState(String recipe) async {
    emit(RecipeState.loading());
    ApiResult<RecipeApi> apiState = await repo.getRecipeApi(recipe);
    apiState.when(
        success: (data) => emit(RecipeState.loaded(data)),
        failure: (e) => emit(RecipeState.error(e)));
  }
}
