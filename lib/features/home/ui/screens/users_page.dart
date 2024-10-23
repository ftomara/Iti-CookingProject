// ignore_for_file: prefer_const_constructors

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/user_info_list_cubit.dart';
import 'package:cooking_app/features/home/logic/user_info_state.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/features/home/ui/widgets/users_card_gen.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserInfoListCubit>().getusers();
    return BlocBuilder<UserInfoListCubit, UserinfoState>(
        builder: (context, usersState) {
      if (usersState is UserinfoStateLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: MyColors.orangecolor,
          ),
        );
      } else if (usersState is UserinfoStateLoaded) {
        List<Userfbs> users = usersState.data as List<Userfbs>;
        return Padding(
          padding: const EdgeInsets.only(top: 36),
          child: Column(
            children: [
              //Search(),
              Expanded(child: UsersCardGen(users)),
            ],
          ),
        );
      } else if (usersState is UserinfoStateError) {
        return Center(
            child: Text(
          'Something Went Wrong',
          style: MyTextStyle.hello,
        ));
      } else {
        return Center(
            child: Text(
          'No Users Data Found',
          style: MyTextStyle.hello,
        ));
      }
    });
  }
}
