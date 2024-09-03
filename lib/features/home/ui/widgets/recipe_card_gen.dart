// ignore_for_file: prefer_const_constructors

import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

class RecipeCardGen extends StatefulWidget
{
  const RecipeCardGen({super.key});

  @override
  State<StatefulWidget> createState() => _RecipeCardGenState();
    
  

}

class _RecipeCardGenState extends State<RecipeCardGen>{
  @override
  Widget build(BuildContext context) { /// takes a recipeinfo object to generate 
   return ListView.builder( itemCount: 30, itemBuilder: (context,index)
   {
    // print('list generated');
       return RecipeCard();
   });
  }


}