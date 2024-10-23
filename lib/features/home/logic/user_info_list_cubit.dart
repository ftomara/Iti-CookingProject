import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/features/home/logic/user_info_state.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/features/home/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfoListCubit extends Cubit<UserinfoState> {
  Repository repo;
  UserInfoListCubit(this.repo) : super(UserinfoState.intial());
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
