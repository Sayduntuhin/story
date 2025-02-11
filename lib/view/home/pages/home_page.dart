import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../themes/colors.dart';
import '../../widgets/custom_buttom.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _showSecondPage = false;

  // List of pages to navigate to
  final List<Widget> _pages = [
    SplashPage(),
    SecondPage(),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showSecondPage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _showSecondPage ? _pages[1] : _pages[0],

        ],
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/onboardImage/welcomeImage.png', width: 288.w,height: 192.h,), // Use the provided image path
          SizedBox(height: 20.h),
          Text(
            "Welcome To our Family",
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w), // Responsive padding

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/onboardImage/welcomeImageSecoundery.png', width: 295.w,height: 409.h,), // Use the provided image path
            SizedBox(height: 20.h),
            Text(
              "Hi Alex!",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(32),
                fontWeight: FontWeight.bold,
                color: textColor,
              ),


            ),
            SizedBox(height: 10.h),
            Text(
                "Thank you for sharing about your childhood. Let's continue capturing these precious moments together.",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                color: Color(0xff7D917E),
              ),
            ),
            SizedBox(height: 40.h),
            CustomButton(
              text: 'TALK TO TITI',
              route: '/aiBot',
              buttonColor: buttonColor,
              textColor: buttonTextColor,
              isPush: true,
            ),
          ],
        ),
      ),
    );
  }
}
