import 'package:cooking_app/core/network/api/api_exception.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  factory ApiResult.success(T data) = _sucess<T>;
  factory ApiResult.failure(ApiException e) = _failure<T>;
}
