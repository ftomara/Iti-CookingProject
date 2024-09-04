import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:flutter/material.dart';

class AccountStatusWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final Function nextPage;

  const AccountStatusWidget(
      {super.key,
      required this.nextPage,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: MyTextStyle.haveAccount,
        ),
        GestureDetector(
          onTap: () {
            nextPage();
          },
          child: Text(
            text2,
            style: MyTextStyle.signUpButton,
          ),
        ),
      ],
    );
  }
}
