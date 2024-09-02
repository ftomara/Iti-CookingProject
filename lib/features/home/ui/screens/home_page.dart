import 'package:cooking_app/features/home/ui/widgets/catigories.dart';
import 'package:cooking_app/features/home/ui/widgets/search.dart';
import 'package:cooking_app/features/home/ui/widgets/welcoming_bar.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     
return SafeArea(
  child: Scaffold(
    backgroundColor: MyColors.butterycolor,
    body: Padding(
      padding: EdgeInsets.only(top: 64),
      child: Column(
        children: [
          WelcomingBar(),
          Search(),
          Catigories(),
        ],
      ),
    ),
  ),
);
  }
  
}