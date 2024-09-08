import 'package:bloc/bloc.dart';
import 'package:cooking_app/core/network/api/api_result.dart';
import 'package:cooking_app/features/home/logic/recipe_state.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/features/home/repository/repository.dart';

class RecipeInfoCubit extends Cubit<RecipeState> {
  Repository repo;

  RecipeInfoCubit(this.repo) : super(RecipeState.intial());
  void emitState(int id) async {
    emit(RecipeState.loading());
    ApiResult<RecipeInfo> apiState = await repo.getRecipeInfo(id);
    apiState.when(
        success: (data) => emit(RecipeState.loaded(data)),
        failure: (e) => emit(RecipeState.error(e)));
  }
}
