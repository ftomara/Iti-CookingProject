import 'package:cooking_app/core/common_widgets/account_status_widget.dart';
import 'package:cooking_app/core/common_widgets/button_widget.dart';
import 'package:cooking_app/core/helper/navigation%20.dart';
import 'package:cooking_app/core/network/firebase/authenticate%20.dart';
import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/user_cubit.dart';
import 'package:cooking_app/features/home/ui/screens/sign_up_page.dart';
import 'package:cooking_app/features/home/ui/widgets/text_field_widget.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  LoginPage({super.key});
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // final authenticate = GetIt.instance<Authenticate>();
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
                    "LogIn",
                    style: MyTextStyle.biteguide,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  gettext("Email"),
                  TextFieldWidget(
                    controller: email,
                    password: false,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  gettext("Password"),
                  TextFieldWidget(
                    controller: password,
                    password: true,
                  ),
                  SizedBox(
                    height: 125.h,
                  ),
                  Center(
                    child: ButtonWidget(
                        style: MyTextStyle.textButton,
                        text: "LogIn",
                        onPress: () async {
                          if (_key.currentState!.validate()) {
                            await AuthenticateImpl(GetIt.instance<UserCubit>())
                                .signInUser(email.text, password.text, context)
                                .then((_) {
                              if (context.mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyCookingApp()),
                                ).catchError((error) {
                                  print('failed navigation');
                                });
                                print("sucess navigation");
                              }
                            }).catchError((error) {
                              print("failed navigation");
                            });
                            //  await AuthenticateImpl()
                            //     .signInUser(email.text, password.text, context)
                            //     .then((_) {
                            //   if (context.mounted) {
                            //     Navigator.pushReplacement(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => HomePage()),
                            //     );
                            //   }
                            // }).catchError((error) {
                            //   print("failed navigation");
                            // });
                          }
                        },
                        height: 55.h,
                        width: 306.w),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 97.w),
                    child: AccountStatusWidget(
                        nextPage: () => PushNavigation(context, SignUpPage()),
                        text1: "Don’t have an account ?",
                        text2: "SignUp"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding gettext(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h, top: 12.h),
      child: Text(
        text,
        style: MyTextStyle.textfield,
      ),
    );
  }
}
