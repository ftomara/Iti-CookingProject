import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/core/network/firebase/firebase_result.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_state.dart';
import 'package:cooking_app/features/home/repository/repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class UploadRecipeCubit extends Cubit<UploadRecipeState<void>> {
  Repository repo;
  UploadRecipeCubit(this.repo) : super(UploadRecipeState.intial());
  Future<void> uploadRecipe(Recipe recipe, String userId) async {
    emit(UploadRecipeState.loading());
    try {
      await repo.uploadRecipe(recipe, userId);
      emit(UploadRecipeState.loaded(true));
    } catch (e) {
      emit(UploadRecipeState.error(FirebaseException(plugin: e.toString())));
    }
  }

  Future<void> fetchAllRecipes(String? userId) async {
    emit(UploadRecipeState.loading());
    try {
      final recipes = await repo.getRecipes(userId!);
      emit(UploadRecipeState.loaded(recipes));
    } catch (e) {
      emit(UploadRecipeState.error(FirebaseException(plugin: e.toString())));
    }
  }

  Future<void> fetchRecipe(String userId, String recipeTitle) async {
    emit(UploadRecipeState.loading());
    try {
      final recipe = await repo.getRecipe(userId, recipeTitle);
      if (recipe != null) {
        emit(UploadRecipeState.loaded(recipe));
      } else {
        emit(UploadRecipeState.error(
            FirebaseException(plugin: "Recipe not found")));
      }
    } catch (e) {
      emit(UploadRecipeState.error(FirebaseException(plugin: e.toString())));
    }
  }
}
