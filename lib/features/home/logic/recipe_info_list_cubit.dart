import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/core/network/firebase/firebase_result.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_state.dart';
import 'package:cooking_app/features/home/repository/repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class RecipeListCubit extends Cubit<UploadRecipeState<void>> {
  Repository repo;
  RecipeListCubit(this.repo) : super(UploadRecipeState.intial());

  Future<void> fetchAllRecipes(String? userId) async {
    emit(UploadRecipeState.loading());
    try {
      final recipes = await repo.getRecipes(userId!);
      emit(UploadRecipeState.loaded(recipes));
    } catch (e) {
      emit(UploadRecipeState.error(FirebaseException(plugin: e.toString())));
    }
  }


}
