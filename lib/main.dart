import 'package:cooking_app/checkuser.dart';
import 'package:cooking_app/core/di/module.dart';
import 'package:cooking_app/core/network/api/api_service.dart';
import 'package:cooking_app/core/network/api/dio_config.dart';
import 'package:cooking_app/firebase_options.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  setupDependinces();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const Checkuser());
}
