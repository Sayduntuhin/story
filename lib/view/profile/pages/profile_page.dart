import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:story_always/view/widgets/custom_appbar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Profile", showBackButton: false,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          children: [

            CircleAvatar(
              radius: 50.r,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: AssetImage('assets/onboardImage/profile_image.png'),
            ),
            SizedBox(height: 20.h),
            Text(
              "Rafsun Hossen",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit Profile"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Edit Profile page
              },
            ),
           SizedBox(height: 10.h),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("rafsun12@gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("+550512885465"),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Male"),
            ),

            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("27/05/2000"),
            ),

            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("London park, UK"),
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
               context.push("/setting");
              },
            ),
           Spacer(),
            ListTile(
              leading:   Icon(Icons.logout,color: Colors.red,),
              title: Text("Log Out"),
              onTap: () {
                // Navigate to Settings page
              },
            ),
            SizedBox(height: 50.h),

          ],
        ),
      ),
    );
  }
}
