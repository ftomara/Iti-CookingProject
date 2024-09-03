import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';

extension SnackbarExtention on BuildContext {
  void snackbar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: MyColors.butterycolor),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      //backgroundColor: MyColors.orangecolor,
    ));
  }
}
