import 'package:cooking_app/checkuser.dart';
import 'package:cooking_app/core/di/module.dart';
import 'package:cooking_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependinces();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Checkuser());
}
