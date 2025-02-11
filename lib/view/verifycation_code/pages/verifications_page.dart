import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_always/themes/colors.dart';
import 'package:story_always/view/widgets/custom_buttom.dart';
import 'package:story_always/view/widgets/footer_icons.dart';
import 'package:story_always/view/widgets/logo_widgets.dart';

import '../../widgets/custom_appbar.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({
    super.key,
  });

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  late List<TextEditingController> _otpControllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _otpControllers = List.generate(4, (_) => TextEditingController());
    _focusNodes = List.generate(4, (_) => FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: "Verify Code",
          showBackButton: true,
        ),
        body: Column(
          children: [
            buildLogo(),
            SizedBox(height: 60.h),
            Text(
              'Enter Verification Code',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: secounderyTextColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 50.w,
                    height: 55.h,
                    child: TextField(
                      controller: _otpControllers[index],
                      focusNode: _focusNodes[index],
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style:
                          TextStyle(fontSize: 24, color: secounderyTextColor),
                      decoration: const InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: Color(0xffE2E8F0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10)),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          _focusNodes[index + 1].requestFocus();
                        } else if (value.isEmpty && index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  ),
                );
              }),
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              text: "VERIFY NOW ",
              route: '/reset-password',
              buttonColor: buttonColor,
              textColor: buttonTextColor,
              isPush: true,
            ),
            SizedBox(
              height: 100.h,
            ),
            buildFooterIcons(context)
          ],
        ),
      );
  }
}
