import 'dart:io';
import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:story_always/themes/colors.dart';
import 'package:story_always/view/widgets/custom_appbar.dart';
import 'package:story_always/view/widgets/custom_buttom.dart';
import 'package:story_always/view/widgets/custom_textField.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  Country? _selectedCountry;
  String _gender = "Male"; // Default gender
  DateTime _dob = DateTime.now(); // Default Date of Birth
  final TextEditingController _fastNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Pick an image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Show image picker options
  void _showImagePickerOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select an Image"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Pick from Camera"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                title: Text("Pick from Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCountryPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CountryPickerDialog(
          title: Text("Select your location"),
          onValuePicked: (Country country) {
            setState(() {
              _selectedCountry = country;
            });
          },
          itemBuilder: (Country country) {
            return Row(
              children: [
                CountryPickerUtils.getDefaultFlagImage(country),
                SizedBox(width: 10.w),
                Text(country.name),
              ],
            );
          },
        );
      },
    );
  }

  // Date Picker for Date of Birth
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dob,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _dob) {
      setState(() {
        _dob = pickedDate;
      });
    }
  }

  // Function to validate and submit the form
  void _submitForm() {
    print('__________________________dbfghrfghsj____________________');
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }
    // Handle the form submission here (e.g., call API to create account)
    print('Account Created!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Create Account",
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: _showImagePickerOptions,
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(Icons.camera_alt, size: 50.sp, color: Colors.grey)
                      : null,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 170.w,
                    child: CustomTextField(
                      text: "Full Name",
                      controller: _fastNameController,
                      hintText: "First name",
                    )),
                SizedBox(
                    width: 170.w,
                    child: CustomTextField(
                      text: " ",
                      controller: _lastNameController,
                      hintText: "Last name",
                    )),
              ],
            ),
            SizedBox(height: 5.h),
            CustomTextField(
                text: "Email Address",
                controller: _emailController,
                hintText: "Email"),
            SizedBox(height: 5.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone Number",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10.h),
                IntlPhoneField(
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    focusColor: textColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: textColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: textColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: textColor),
                    ),
                  ),
                  languageCode: "en",
                  keyboardType: TextInputType.phone,
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country changed to: ' + country.name);
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: textColor),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GestureDetector(
                    onTap: _showCountryPicker,
                    child: Row(
                      children: [
                        if (_selectedCountry != null)
                          CountryPickerUtils.getDefaultFlagImage(
                              _selectedCountry!),
                        SizedBox(width: 10.w),
                        Text(
                          _selectedCountry != null
                              ? _selectedCountry!.name
                              : "Select Country",
                          style: TextStyle(
                              fontSize: 16.sp, color: secounderyTextColor),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10.h),
                DropdownButtonFormField<String>(
                  value: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                  items: ["Male", "Female", "Other"].map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(
                        gender,
                        style: TextStyle(
                            color: secounderyTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300),
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    focusColor: textColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: textColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date of Birth",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: textColor),
                    ),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: "Date of Birth",
                        hintText: "${_dob.day}/${_dob.month}/${_dob.year}",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              text: "Password",
              hintText: "Enter your password",
              controller: _passwordController,
              obscureText: true,
            ),
            CustomTextField(
              text: "Confirm Password",
              hintText: "Confirm your password",
              controller: _confirmPasswordController,
              obscureText: true,
            ),
            SizedBox(height: 5.h),
            CustomButton(
                text: "SIGN UP",
                route: '/language',
                isPush: true,
                onPressed: _submitForm,
                buttonColor: buttonColor,
                textColor: buttonTextColor),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
