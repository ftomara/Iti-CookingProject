import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatefulWidget {
  TextEditingController controller;
  
  final bool password;
  TextFieldWidget({super.key, required this.password,required this.controller});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _visible = false;
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: _hasError
            ? []
            : [
                BoxShadow(
                  color: Color(0x40000000),
                  offset: Offset(0, 4),
                  blurRadius: 4.r,
                  spreadRadius: 0,
                ),
              ],
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          setState(() {
            _hasError = value == null || value.isEmpty;
          });
          if (_hasError) {
            return "Required";
          }
          return null;
        },
        obscureText: widget.password ? !_visible : false,
        decoration: InputDecoration(
          suffixIcon: widget.password
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _visible = !_visible;
                    });
                  },
                  icon: Icon(
                    _visible ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 23.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(width: 1.5.w, color: MyColors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: MyColors.orangecolor, width: 1.5.w),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: Colors.red, width: 1.5.w),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: Colors.red, width: 1.5.w),
          ),
          filled: true,
          fillColor: MyColors.butterycolor,
        ),
        style: TextStyle(
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
