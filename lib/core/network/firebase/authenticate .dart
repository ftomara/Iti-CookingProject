// ignore_for_file: avoid_print, use_build_context_synchronously, file_names

import 'package:cooking_app/core/network/firebase/firebase_services.dart';
import 'package:cooking_app/features/home/logic/user_cubit.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/features/home/ui/screens/biteguide_page.dart';
import 'package:cooking_app/core/helper/navigation .dart';
import 'package:cooking_app/features/home/ui/screens/main_page.dart';
import 'package:cooking_app/util/extentions/snackbar_extention.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class Authenticate {
  void createUser(
      String email, String password, String username, BuildContext context);
  void signInUser(String email, String password, BuildContext context);
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
      String userId = credential.user!.uid;
      _userCubit.setUserId(userId);
      context.snackbar("Log In Successful!");
      PushNavigation(context, const MainPage());
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
      return; // Return early if there was an error
    } catch (e) {
      context.snackbar("An unexpected error occurred");
      print(e);
      return; // Return early on unexpected errors
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

  Future<void> signOutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Sign out from Firebase
      _userCubit.clearUserId(); // Clear the user ID in your app state

      // Show a snackbar notification
      context.snackbar("Log Out Successful!");

      // Navigate to the initial screen (BiteGuide screen)
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BiteguidePage()),
        (route) => false, // Remove all routes and replace with the new one
      );
    } catch (e) {
      context.snackbar("An error occurred while logging out: ${e.toString()}");
      print("Logout error: $e");
    }
  }
}
