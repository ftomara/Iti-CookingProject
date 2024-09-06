import 'package:cooking_app/core/network/api/api_exception.dart';
import 'package:cooking_app/core/network/firebase/firebase_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'firebase_result.freezed.dart';

@freezed
abstract class FirebaseResult<T> with _$FirebaseResult<T> {
  factory FirebaseResult.success(T data) = _sucess<T>;
  factory FirebaseResult.failure(FirebaseException e) = _failure<T>;
}
