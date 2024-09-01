import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                signup();
              },
              child: Center(
                child: Text("Login"),
              )),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Center(
                child: Text("signup"),
              )),
        ],
      ),
    );
  }

  Future<void> signup() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "hlakhaled@gmail.com",
        password: "hla123",
      );
      print("dd");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
