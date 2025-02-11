import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:story_always/themes/colors.dart';
import 'package:story_always/view/widgets/custom_appbar.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isWritingReminderEnabled = false; // For the toggle button
  String _selectedLanguage = 'English'; // Default language

  // Function to show the delete confirmation dialog
  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(child: Text("Delete")),
          content: Text(
            "Do you want to delete your account?? \nIt will permanently delete your user data.",
            style: TextStyle(fontSize: 14.sp),textAlign: TextAlign.center,
          ),
          actions: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      print("Account deleted");
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.red
                    ),
                    child: Text("DELETE",style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  width: double.infinity,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: textColor),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("CANCEL", style: TextStyle(color: textColor,fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),

          ],
        );
      },
    );
  }

  // Function to handle language selection from dropdown
  void _onLanguageChanged(String? value) {
    setState(() {
      _selectedLanguage = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Setting", showBackButton: true,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: ListView(
          children: [
            SizedBox(height: 50.h,),
            Text("Account",style: TextStyle(fontSize: 18.sp),),
            ListTile(
              leading: Icon(Icons.subscriptions),
              title: Text("Manage subscription",style: TextStyle(fontSize: 18.sp),),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                context.push("/subscription");
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text("Delete Account",style: TextStyle(fontSize: 18.sp)),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: _showDeleteDialog, // Show delete confirmation dialog
            ),
            SizedBox(height: 20.h),

            Text("Help",style: TextStyle(fontSize: 18.sp),),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email Support"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle navigate to email support
              },
            ),
            SizedBox(height: 20.h),

            Text("Notification",style: TextStyle(fontSize: 18.sp),),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Writing Reminder"),
              trailing: Switch(
                value: _isWritingReminderEnabled,
                onChanged: (value) {
                  setState(() {
                    _isWritingReminderEnabled = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20.h),

            // Language Section (Dropdown)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Language",style: TextStyle(fontSize: 18.sp),),

                SizedBox(height: 10.h),
                Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: textColor),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: DropdownButton<String>(
                    value: _selectedLanguage,
                    onChanged: _onLanguageChanged,
                    items: [
                      DropdownMenuItem(
                        value: 'English',
                        child: Text('English',style: TextStyle(
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      DropdownMenuItem(
                        value: 'Española',
                        child: Text('Española',style: TextStyle(
                            fontWeight: FontWeight.w300
                        )),
                      ),
                    ],
                    isExpanded: true,
                    underline: SizedBox(), // Remove the underline
                    icon: Icon(Icons.arrow_drop_down),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
