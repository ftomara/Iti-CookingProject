import 'package:cooking_app/core/di/module.dart';
import 'package:cooking_app/core/network/api/api_result.dart';
import 'package:cooking_app/core/network/api/api_service.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/firebase_options.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependinces(); 

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp( MyCookingApp());
}

