import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildLogo() {
 return Column(
    children: [
      Center(
        child: Image.asset(
          'assets/onboardImage/logo_image.png', // Replace with your logo
          height: 90.h,
        ),
      ),
      Image.asset(
        'assets/onboardImage/logo.png', // Replace this with your logo/image
        height: ScreenUtil().setHeight(50), // Adjust height as needed
        width: ScreenUtil().setWidth(211), // Adjust width as needed
        fit: BoxFit.contain,
      ),
    ],
  );
}