// ignore_for_file: prefer_const_constructors

import 'package:cooking_app/features/home/ui/widgets/search.dart';
import 'package:cooking_app/features/home/ui/widgets/users_card_gen.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: Column(
        children: const [
     //     Search(),
          //  UsersCard(),
          Expanded(child: UsersCardGen()),
          // SizedBox(height:500,),
        ],
      ),
    );
  }
}
