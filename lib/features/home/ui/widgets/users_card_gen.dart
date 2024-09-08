// ignore_for_file: unused_import

import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:cooking_app/features/home/ui/widgets/users_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersCardGen extends StatefulWidget {
  const UsersCardGen(this.users, {super.key});
  final List<Userfbs> users;
  @override
  State<UsersCardGen> createState() => _UsersCardGenState();
}

class _UsersCardGenState extends State<UsersCardGen> {
  @override
  Widget build(BuildContext context) {
    /// takes a Usersinfo object to generate
    return ListView.builder(
        itemCount: widget.users.length,
        itemBuilder: (context, index) {
          // print('list generated');
          return Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              UsersCard(widget.users[index]),
            ],
          );
        });
  }
}
