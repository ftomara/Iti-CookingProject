import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_recipe_state.freezed.dart';
@freezed
abstract class UploadRecipeState<T> with _$UploadRecipeState<T> {
  factory UploadRecipeState.intial() = UploadRecipeStateIntial;
  factory UploadRecipeState.loading() = UploadRecipeStateLoading;
  factory UploadRecipeState.loaded(T data) = UploadRecipeStateLoaded<T>;
  factory UploadRecipeState.error(FirebaseException e) = UploadRecipeStateError;
}
