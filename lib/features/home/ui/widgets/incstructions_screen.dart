import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:flutter/material.dart';

import '../../model/recipe.dart';
import 'back_button_appbar.dart';
import 'instrcutions_listview.dart';

class IncstructionsScreen extends StatelessWidget {
  const IncstructionsScreen({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonAppbar(
              title: recipe.title,
            ),
            const SizedBox(
              height: 16,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                recipe.impPath,
                width: double.infinity,
                height: 224,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Instructions:',
              style: MyTextStyle.instructionsAndIngreadiants,
            ),
            const SizedBox(height: 16),
            InstrcutionsListview(contentList: recipe.instructions),
          ],
        ),
      ),
    );
  }
}