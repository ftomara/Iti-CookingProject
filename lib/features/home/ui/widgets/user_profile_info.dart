// ignore_for_file: unused_import

import 'dart:io';

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/image_cubit.dart';
import 'package:cooking_app/features/home/logic/user_cubit.dart';
import 'package:cooking_app/features/home/logic/user_info_cubit.dart';
import 'package:cooking_app/features/home/logic/user_info_state.dart';
import 'package:cooking_app/features/home/model/user.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:cooking_app/my_cooking_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileInfo extends StatefulWidget {
  UserProfileInfo({super.key});

  Userfbs? user;

  @override
  State<UserProfileInfo> createState() => _UserProfileInfoState();
}

class _UserProfileInfoState extends State<UserProfileInfo> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  @override
  initState() {
    super.initState();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        _image = File(image.path);
        print("uploadbox widget path : ${image.path}");

        final userId = context.read<UserCubit>().state;

        if (userId != null && userId.isNotEmpty) {
          context.read<UserInfoCubit>().uploaduserimage(userId, image.path);
          context.read<UserInfoCubit>().getuser(userId);
        } else {
          print('Error: User ID is null or empty');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserinfoState>(builder: (context, state) {
      if (state is UserinfoStateLoaded) {
        widget.user = state.data as Userfbs?;
      }
      return Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              const SizedBox(
                width: 36,
              ),
              Container(
                width: 100,
                height: 100,
                child: Stack(children: [
                  CircleAvatar(
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : widget.user?.imageUrl != null
                            ? NetworkImage(widget.user!.imageUrl)
                            : null,
                    radius: 40,
                    backgroundColor: MyColors.orangecolor,
                  ),
                  Positioned(
                    top: 44,
                    left: 43,
                    child: IconButton(
                        onPressed: _pickImage,
                        icon: _image == null
                            ? Icon(
                                Icons.camera_alt_rounded,
                                color: MyColors.greycolor,
                              )
                            : Icon(Icons.edit)),
                  ),
                ]),
              ),
              const SizedBox(
                width: 48,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '5K',
                        style: MyTextStyle.hello,
                      ),
                      Text(
                        'Followers',
                        style: MyTextStyle.hellothin,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 36.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.user?.recipeslength}',
                        style: MyTextStyle.hello,
                      ),
                      Text(
                        'Recipes',
                        style: MyTextStyle.hellothin,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ],
      );
    });
  }
}
