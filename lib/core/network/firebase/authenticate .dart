import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/util/extentions/snackbar_extention.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class Authenticate {
  void createUser(
      String email, String Password, String username, BuildContext context);
  void signInUser(String email, String Password, BuildContext context);
}

class AuthenticateImpl extends Authenticate {
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

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'username': username,
        'email': email,
      });
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
      context.snackbar("Log In Successful!");
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
}
