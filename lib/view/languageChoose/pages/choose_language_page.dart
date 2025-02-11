import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_always/view/widgets/custom_appbar.dart';
import 'package:story_always/view/widgets/custom_buttom.dart';
import 'package:story_always/view/widgets/logo_widgets.dart';

import '../../../themes/colors.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  // This variable will track the selected language
  String _selectedLanguage = 'English';

  // Function to handle language selection
  void _selectLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "", showBackButton: true,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: ListView(
          children: [
            buildLogo(),
            Text(
              "una historia para siempre",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                fontWeight: FontWeight.w400,
                color: textColor,

              ),
            ),
            SizedBox(height: 20.h), // Space for the header
            Text(
              "Choose your \npreferred language",
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              "The AI will chat with You in the chosen \nlanguage.",
              style: TextStyle(fontSize: 16.sp, color: Colors.black,fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 40.h), // Space between the text and languages

            // Language options
            GestureDetector(
              onTap: () => _selectLanguage('English'),
              child: Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: _selectedLanguage == 'English' ? Color(0x338CAB91) : Color(0xffF2F2F7) ,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                      color: _selectedLanguage == 'English'
                          ? textColor
                          : Colors.grey),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/flags/english.png', // Use the actual flag image
                      width: 30.w,
                      height: 20.h,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'English',
                      style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    ),
                    Spacer(),
                    if (_selectedLanguage == 'English')
                      Image.asset('assets/icons/checkbox.png' , width: 20.w, height: 20.h,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () => _selectLanguage('Española'),
              child: Container(

                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: _selectedLanguage == 'Española' ? Color(0x338CAB91) : Color(0xffF2F2F7) ,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                      color: _selectedLanguage == 'Española'
                          ? textColor
                          : Colors.grey),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/flags/spain.png',
                      width: 30.w,
                      height: 20.h,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Española',
                      style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    ),
                    Spacer(),
                    if (_selectedLanguage == 'Española')
                      Image.asset('assets/icons/checkbox.png' , width: 20.w, height: 20.h,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h), // Space for confirm button

            CustomButton(text: "CONFIRM", route: "", buttonColor: buttonColor, textColor: buttonTextColor)
      /*      ElevatedButton(
              onPressed: () {
                // Handle confirm button action, like navigating to next page
                print("Selected Language: $_selectedLanguage");
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                "CONFIRM",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
