import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';

import '../../../themes/colors.dart';

Widget buildOnboardingContent(String image, String heading, String description) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: ScreenUtil().setHeight(420),
          width: ScreenUtil().setWidth(200.w),
          fit: BoxFit.contain,
        ),
        SizedBox(height: ScreenUtil().setHeight(40)),

        Text(
          heading,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(32),
            fontWeight: FontWeight.bold,
            color: textColor,

          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(20)),

        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(16),
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(50)),
      ],
    ),
  );
}
Widget buildOnboardingContentForFastPage(String image, String heading, String description) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: ScreenUtil().setWidth(400),
          height: ScreenUtil().setHeight(400),
          child: Gif(
            image: AssetImage(image),
            fit: BoxFit.contain,
            autostart: Autostart.once,
            repeat: ImageRepeat.noRepeat,
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(40)),
        Row(
          children: [
            Text(
              heading,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(32),
                fontWeight: FontWeight.bold,
                color: textColor,
              ),


            ),
            SizedBox(width: 10),
            SizedBox(
              height: ScreenUtil().setHeight(50),
              width: ScreenUtil().setWidth(150),
              child: Image.asset(
                'assets/onboardImage/logo.png',  // Replace this with your logo/image
                height: ScreenUtil().setHeight(50),  // Adjust height as needed
                width: ScreenUtil().setWidth(150),  // Adjust width as needed
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        SizedBox(height: ScreenUtil().setHeight(20)),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(16),
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(50)),
      ],
    ),
  );
}