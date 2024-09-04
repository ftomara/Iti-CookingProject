import 'package:cooking_app/core/common_widgets/account_status_widget.dart';
import 'package:cooking_app/core/common_widgets/button_widget.dart';
import 'package:cooking_app/core/helper/navigation%20.dart';
import 'package:cooking_app/core/network/firebase/authenticate%20.dart';
import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(left: 31.w, right: 31.w, top: 30.h),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SignUp",
                  style: MyTextStyle.biteguide,
                ),
                SizedBox(
                  height: 32.h,
                ),
                gettext("Username"),
                TextFieldWidget(
                  controller: username,
                  password: false,
                ),
                gettext("Email"),
                TextFieldWidget(
                  controller: email,
                  password: false,
                ),
                gettext("Password"),
                TextFieldWidget(
                  controller: password,
                  password: true,
                ),
                SizedBox(
                  height: 64,
                ),
                Center(
                  child: ButtonWidget(
                      style: MyTextStyle.textButton,
                      text: "Create Account",
                      onPress: () {
                        if (_key.currentState!.validate()) {
                          AuthenticateImpl().createUser(email.text,
                              password.text, username.text, context);
                        }
                      },
                      height: 55.h,
                      width: 306.w),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 96.w),
                  child: AccountStatusWidget(
                      nextPage: () => popNavigation(context),
                      text1: "Already have an account ?",
                      text2: "LogIn"),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Padding gettext(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h, top: 12.h),
      child: Text(
        "$text",
        style: MyTextStyle.textfield,
      ),
    );
  }
}
