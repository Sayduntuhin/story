import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_always/themes/colors.dart';
import 'package:story_always/view/widgets/footer_icons.dart';
import 'package:story_always/view/widgets/logo_widgets.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/custom_textField.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // For form validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:CustomAppBar(title: 'Forgot Password',showBackButton: true,) ,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Form(
          key: _formKey, // Set the form key for validation
          child: ListView(
            children: [
              SizedBox(height: 40.h),
               buildLogo(),
              SizedBox(height: 40.h),
              Center(child: Text("Enter your email to reset your password.",style: TextStyle(fontSize: 18),)),
              SizedBox(height: 20.h),
              CustomTextField(
                text: "Email",
                controller: _emailController,
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h,),
              CustomButton(
                text: 'CONTINUE',
                route: '/verify-code',
                buttonColor: buttonColor,// The route to navigate to (Verify Code page)
                textColor: buttonTextColor,
                isPush: true,
              ),
              SizedBox(height: 80.h,),
              buildFooterIcons(context)
            ],
          ),
        ),
      ),
    );
  }
}
