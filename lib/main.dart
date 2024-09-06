import 'package:cooking_app/core/di/module.dart';
import 'package:cooking_app/core/network/api/api_result.dart';
import 'package:cooking_app/core/network/api/api_service.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/firebase_options.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure bindings are initialized

  setupDependinces(); // Initialize dependencies

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Test the ApiService after dependencies are set up
 //await testApiService();

  runApp(const MyCookingApp());
}

Future<void> testApiService() async {
  final apiService = get<ApiService>(); // Use GetIt to retrieve ApiService

 try {
  ApiResult<RecipeInfo> result = await apiService.getInfo(660185);

  result.when(
    success: (data) {
      print("Recipe Info: $data");
    },
    failure: (e) {
      print("Error: ${e.message}");
    },
  );
} catch (e) {
  print("Exception: $e");
}

}
