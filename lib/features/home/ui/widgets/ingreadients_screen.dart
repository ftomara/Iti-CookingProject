import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/themes/my_text_style.dart';
import '../../model/recipe.dart';
import 'back_button_appbar.dart';
import 'instrcutions_listview.dart';

class IngreadientsScreen extends StatelessWidget {
  const IngreadientsScreen({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BackButtonAppbar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          recipe.impPath,
                          width: 130,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.title,
                              style: GoogleFonts.oswald(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: MyColors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/servings.svg'),
                                const SizedBox(width: 4),
                                Text(
                                  "1 Serving",
                                  style: MyTextStyle.serving,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Check Your Ingredients:',
                    style: MyTextStyle.instructionsAndIngreadiants,
                  ),
                  const SizedBox(height: 16),
                  InstrcutionsListview(contentList: recipe.ingreadiants),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
