import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:story_always/view/widgets/custom_appbar.dart';
import 'package:story_always/view/widgets/custom_textField.dart';
import 'package:story_always/view/widgets/footer_icons.dart';

import '../../../themes/colors.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/logo_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Login',
        showBackButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w), // Responsive padding
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 20.h),
              buildLogo(),
              SizedBox(height: 40.h),
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
              SizedBox(height: 10.h),
              CustomTextField(
                text: "Password",
                controller: _passwordController,
                hintText: "Enter your password",
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    context.push('/forget-password');
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      text: 'LOG IN',
                      route: '/main',
                      buttonColor: buttonColor,
                      textColor: Colors.white)),
              buildFooterIcons(context)
            ],
          ),
        ),
      ),
    );
  }
}
