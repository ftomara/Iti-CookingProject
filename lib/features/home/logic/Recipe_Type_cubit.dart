// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:cooking_app/features/home/model/recipe_types.dart';

class RecipeTypeCubit extends Cubit<RecipeTypes?> {
  RecipeTypeCubit() : super(null);

  void setRecipeTypeCubitpath(RecipeTypes type) {
    emit(type);
  }

  void clearRecipeTypeCubitpath() {
    emit(null);
  }
}
