import 'package:flutter/material.dart';

import '../../../../core/themes/my_text_style.dart';
import '../../../../my_colors.dart';

class ServingsInputField extends StatelessWidget {
  const ServingsInputField({super.key, required this.servingsController});

  final TextEditingController servingsController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Text(
            'Servings :',
            style: MyTextStyle.question,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              controller: servingsController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
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
                hintText: 'No. Servings',
              ),
              style: MyTextStyle.input,
            ),
          ),
        ],
      ),
    );
  }
}
