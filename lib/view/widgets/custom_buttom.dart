import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String route;
  final Color buttonColor;
  final Color textColor;
  final bool isPush;
  final void Function()?onPressed;

  CustomButton({
    required this.text,
    required this.route,
    required this.buttonColor,
    required this.textColor,
    this.isPush = false,
     this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
       // onPressed!;
          if (isPush) {
        /*    onPressed!;*/
            context.push(route);
          } else {
          /*  onPressed!;*/
            context.go(route);
          }


      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(120),
          vertical: ScreenUtil().setHeight(10),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        backgroundColor: buttonColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(16),
          color: textColor,
        ),
      ),
    );
  }
}
