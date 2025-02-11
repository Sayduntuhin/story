import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../themes/colors.dart';

Widget buildFooterIcons(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: 20.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              context.push('/create-account');
            },
            child: Text(
              "Create a account",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            "or sign up with",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      SizedBox(height: 10.h),
      InkWell(
        onTap: () {},
        child: Center(
          child: Container(
            width: 220.w,
            height: 40.h,
            decoration: BoxDecoration(
              border: Border.all(color: textColor),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/google.png',
                  width: 60.w,
                ),
                Text(
                  "log in with Google",
                  style: TextStyle(
                      color: secounderyTextColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 10.h),
      InkWell(
        onTap: () {},
        child: Center(
          child: Container(
            width: 220.w,
            height: 40.h,
            decoration: BoxDecoration(
              border: Border.all(color: textColor),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/apple.png',
                  width: 60.w,
                ),
                Text(
                  "log in with Apple",
                  style: TextStyle(
                      color: secounderyTextColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 20.h),
    ],
  );
}
