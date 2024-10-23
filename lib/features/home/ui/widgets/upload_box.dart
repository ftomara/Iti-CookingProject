// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/image_cubit.dart';
import 'package:cooking_app/gen/assets.gen.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadBox extends StatefulWidget {
  const UploadBox({super.key});

  @override
  State<UploadBox> createState() => _UploadBoxState();
}

class _UploadBoxState extends State<UploadBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repeats the animation in reverse

    _animation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: const Offset(0, -0.2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _deleteImage() {
    setState(() {
      _image = null;
    });
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        _image = File(image.path);
        print("uploadbox wedget path : ${image.path}");
        context.read<ImageCubit>().setImagepath(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 43.h,
        ),
        GestureDetector(
          onTap: _pickImage,
          child: DottedBorder(
            dashPattern: const [12, 10],
            color: MyColors.greycolor,
            radius: const Radius.circular(18),
            strokeWidth: 2,
            child: Container(
              height: 197.h,
              width: 343.w,
              decoration: BoxDecoration(
                color: MyColors.butterycolor,
              ),
              child: _image == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                const $AssetsImagesGen().uploadImage),
                            SizedBox(
                              width: 6.w,
                            ),
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return SlideTransition(
                                  position: _animation,
                                  child: child,
                                );
                              },
                              child: SvgPicture.asset(
                                const $AssetsImagesGen().uplaodArrow,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Upload Recipe Image',
                          style: MyTextStyle.hello,
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        Image.file(
                          _image!,
                          width: 343.w,
                          height: 197.h,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                                onPressed: _deleteImage,
                                icon: Icon(
                                  Icons.delete,
                                  color: MyColors.orangecolor,
                                ))),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
