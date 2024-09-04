import 'package:flutter/material.dart';

import '../../../../core/themes/my_text_style.dart';
import '../../../../my_colors.dart';

class RecipeTitleInputField extends StatelessWidget {
  const RecipeTitleInputField({super.key, required this.titleController});

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Title :',
          style: MyTextStyle.question,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: TextField(
            controller: titleController,
            keyboardType: TextInputType.name,
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
              hintText: 'Ex: Pancakes',
            ),
            style: MyTextStyle.input,
          ),
        ),
      ],
    );
  }
}
