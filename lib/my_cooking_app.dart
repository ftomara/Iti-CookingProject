import 'package:cooking_app/features/home/ui/screens/on_boarding.dart';
import 'package:flutter/material.dart';

class MyCookingApp extends StatelessWidget {
  const MyCookingApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     
      home: OnBoarding(),
    );
  }
}