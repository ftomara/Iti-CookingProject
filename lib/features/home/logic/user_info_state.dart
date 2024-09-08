// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_info_state.freezed.dart';

@freezed
abstract class UserinfoState<T> with _$UserinfoState<T> {
  factory UserinfoState.intial() = UserinfoStateIntial;
  factory UserinfoState.loading() = UserinfoStateLoading;
  factory UserinfoState.loaded(T data) = UserinfoStateLoaded<T>;
  factory UserinfoState.error(FirebaseException e) = UserinfoStateError;
}
