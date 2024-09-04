import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/my_text_style.dart';

class TimeInputField extends StatelessWidget {
  const TimeInputField({
    super.key,
    required this.hoursController,
    required this.minutesController,
  });

  final TextEditingController hoursController;
  final TextEditingController minutesController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Time :',
            style: MyTextStyle.question,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: TextField(
              controller: hoursController,
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
                hintText: 'hrs',
              ),
              style: MyTextStyle.input,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            ':',
            style: MyTextStyle.question,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: TextField(
              controller: minutesController,
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
                hintText: 'min',
              ),
              style: MyTextStyle.input,
            ),
          ),
        ],
      ),
    );
  }
}
