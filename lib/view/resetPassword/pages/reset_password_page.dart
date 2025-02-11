import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_always/themes/colors.dart';
import 'package:story_always/view/widgets/custom_appbar.dart';
import 'package:story_always/view/widgets/footer_icons.dart';
import 'package:story_always/view/widgets/logo_widgets.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/custom_textField.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Set New Password", showBackButton: true,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 20.h),
              buildLogo(),
              SizedBox(height: 40.h),
              CustomTextField(
                controller: _passwordController,
                hintText: "Enter your new password",
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                }, text: 'New Password',
              ),
              CustomTextField(
                controller: _confirmPasswordController,
                hintText: "Confirm your new password",
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                }, text: 'Confirm Password',
              ),
              SizedBox(height: 40.h),
              CustomButton(
                text: 'SUBMIT',
                route: '/login',
                buttonColor: buttonColor,
                textColor: buttonTextColor,
              ),
              SizedBox(height: 50.h),
              buildFooterIcons(context)

            ],
          ),
        ),
      ),
    );
  }
}
