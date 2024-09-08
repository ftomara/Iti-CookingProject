import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/core/network/firebase/firebase_result.dart';
import 'package:cooking_app/features/home/logic/user_info_state.dart';
import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/logic/upload_recipe_state.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/features/home/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class UserInfoCubit extends Cubit<UserinfoState> {
  Repository repo;
  UserInfoCubit(this.repo) : super(UserinfoState.intial());
  Future<Userfbs?> getuser(String userId) async {
    emit(UserinfoState.loading());
    try {
      Userfbs? user = await repo.getuser(userId);
      emit(UserinfoState.loaded(user));
      print('emiited');
      return user;
    } catch (e) {
      emit(UserinfoState.error(FirebaseException(plugin: e.toString())));
      print('notemitted');
      return null;
    }
  }

  Future<void> uploaduserimage(String? userId, String? url) async {
    await repo.uploaduserimage(userId!, url!);
  }

  Future<List<Userfbs>?> getusers() async {
    emit(UserinfoState.loading());
    try {
      final users = await repo.getusers();
      emit(UserinfoState.loaded(users));
      return users;
    } catch (e) {
      emit(UserinfoState.error(FirebaseException(plugin: e.toString())));
      return null;
    }
  }
}
