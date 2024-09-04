import 'package:flutter/material.dart';

import '../../../../core/themes/my_text_style.dart';
import '../../../../my_colors.dart';

class CaloriesInputField extends StatelessWidget {
  const CaloriesInputField({super.key, required this.caloriesController});

  final TextEditingController caloriesController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Text(
            'Calories :',
            style: MyTextStyle.question,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              controller: caloriesController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.greycolor, width: 2),
                  borderRadius: BorderRadius.circular(18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: MyColors.greycolor, width: 2),
                ),
                hintText: '600 kcl',
              ),
              style: MyTextStyle.input,
            ),
          ),
        ],
      ),
    );
  }
}
