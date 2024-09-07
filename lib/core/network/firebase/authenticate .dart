import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/core/network/firebase/firebase_services.dart';
import 'package:cooking_app/features/home/logic/user_cubit.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:cooking_app/core/helper/navigation%20.dart';
import 'package:cooking_app/features/home/ui/screens/home_page.dart';
import 'package:cooking_app/features/home/ui/screens/main_page.dart';
import 'package:cooking_app/util/extentions/snackbar_extention.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Authenticate {
  void createUser(
      String email, String Password, String username, BuildContext context);
  void signInUser(String email, String Password, BuildContext context);
}

class AuthenticateImpl extends Authenticate {
  late final UserCubit _userCubit;
  final FirebaseService _firebaseService = FirebaseService();
  AuthenticateImpl(this._userCubit);
  @override
  Future<void> createUser(String email, String password, String username,
      BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String userId = credential.user!.uid;
      _firebaseService
          .addUser(Userfbs(userId: userId, email: email, username: username));
      // await FirebaseFirestore.instance.collection('users').doc(userId).set({
      //   'username': username,
      //   'email': email,
      // });
      _userCubit.setUserId(userId);
      print("state userid : ${_userCubit.state}");
      print('User ID: $userId');
      print(username);
      context.snackbar("Sign Up Successful!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        context.snackbar("The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        context.snackbar("The account already exists for that email");
      } else if (e.code == 'invalid-email') {
        context.snackbar("The email address is badly formatted");
      } else {
        context.snackbar("An error occurred: ${e.message}");
      }
    } catch (e) {
      context.snackbar("An unexpected error occurred");
      print(e);
    }
  }

  @override
  Future<void> signInUser(
      String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String userId = await FirebaseFirestore.instance.collection('users').id;
      _userCubit.setUserId(userId);
      print("Logged ${_userCubit.state}");
      context.snackbar("Log In Successful!");
      PushNavigation(context, MainPage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        context.snackbar("No user found for that email");
      } else if (e.code == 'wrong-password') {
        context.snackbar("Wrong password provided for that user");
      } else if (e.code == 'invalid-email') {
        context.snackbar("The email address is badly formatted");
      } else if (e.code == 'invalid-credential') {
        context.snackbar(
            "The login information provided is incorrect or has expired. Please try again");
      } else {
        context.snackbar("An error occurred: ${e.message}");
      }
    } catch (e) {
      context.snackbar("An unexpected error occurred");
      print(e);
    }
  }

  Future<bool> checkUserAuthentication(BuildContext context) async {
    // Here, check if a user is signed in with Firebase Auth
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      _userCubit.setUserId(user.uid);
      print("checked user id already logged : ${_userCubit.state}");
      return true;
    } else {
      _userCubit.clearUserId();
      return false;
    }
  }
}
