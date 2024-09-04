import 'package:cooking_app/core/network/api/api_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'recipe_state.freezed.dart';
@freezed
abstract class RecipeState<T> with _$RecipeState<T> {
  factory RecipeState.intial() = RecipeStateIntial;
  factory RecipeState.loading() = RecipeStateLoading;
  factory RecipeState.loaded(T data) = RecipeStateLoaded<T>;
  factory RecipeState.error(ApiException e) = RecipeStateError;
}
