import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_always/themes/colors.dart';
import 'package:story_always/view/widgets/custom_buttom.dart';
import '../../widgets/gradient_container.dart';

class UpgradePage extends StatefulWidget {
  const UpgradePage({super.key});
  @override
  State<UpgradePage> createState() => _UpgradePageState();
}
class _UpgradePageState extends State<UpgradePage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              // Container with Image
              Container(
                width: double.infinity,
                height: 280.h,
                decoration: BoxDecoration(
                  color: textColor, // Replace with your desired color
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/secLogo.png', // Replace with your logo asset
                    width: 170.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Positioned Cross Button at Top Right
              Positioned(
                top: 30.h, // Adjust the positioning of the cross button
                right: 10.w, // Adjust the positioning of the cross button
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context); // Navigate back when cross is tapped
                  },
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius:
                          BorderRadius.circular(30.r), // Rounded corners
                    ),
                    child: Icon(
                      Icons.close,
                      size: 20.sp, // Adjust the size of the cross button
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                _buildPremiumPage(),
                _buildOrderHardCopyPage(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomButton(
                text: "UPGRADE NOW",
                route: '/order',
                buttonColor: buttonColor,
                textColor: buttonTextColor),
          ),
        ],
      ),
    );
  }
  Widget _buildPremiumPage() {
    return Padding(
      padding: EdgeInsets.all(40.w),
      child: GradientBorderContainer(
        radius: 15.r,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                "Upgrade to premium",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80, bottom: 50),
                child: Divider(
                  color: textColor,
                  thickness: .5,
                ),
              ),
              _buildUpgradeFeature("Unlimited chat with the AI Chat Bot."),
              _buildUpgradeFeature("Access Full Book."),
              _buildUpgradeFeature("200 images in Book."),
              _buildUpgradeFeature("Downloadable soft copy Pdf book."),
              _buildUpgradeFeature("\$10 off on physical book."),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Color(0xffFAF1E6),
                      border: Border.all(color: textColor),
                      borderRadius: BorderRadius.circular(15.h)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Lifetime Access",
                        style: TextStyle(
                            color: Color(0xff364636),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "20\$",
                        style: TextStyle(
                            color: Color(0xff364636),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        borderGradient: LinearGradient(
          colors: [Color(0xff8CAB91), Color(0xffEBD5BA)],
        ),
      ),
    );
  }
  Widget _buildOrderHardCopyPage() {
    return Padding(
      padding: EdgeInsets.all(40.w),
      child: GradientBorderContainer(
        radius: 15.r,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                "Order Hard Copy",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80, bottom: 50),
                child: Divider(
                  color: textColor,
                  thickness: .5,
                ),
              ),
              _buildUpgradeFeature("Unlimited chat with the AI Chat Bot."),
              _buildUpgradeFeature("Access Full Book."),
              _buildUpgradeFeature("200 images in Book."),
              _buildUpgradeFeature("Downloadable soft copy Pdf book."),
              _buildUpgradeFeature("\$10 off on physical book."),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Color(0xffFAF1E6),
                      border: Border.all(color: textColor),
                      borderRadius: BorderRadius.circular(15.h)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Lifetime Access",
                        style: TextStyle(
                            color: Color(0xff364636),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "70\$",
                        style: TextStyle(
                            color: Color(0xff364636),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        borderGradient: LinearGradient(
          colors: [Color(0xff8CAB91), Color(0xffEBD5BA)],
        ),
      ),
    );
  }
  Widget _buildUpgradeFeature(String featureText) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/icons/checkbox.png',
            width: 20.w,
          ),
        ),
        SizedBox(width: 5.w),
        Text(
          featureText,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
        ),
      ],
    );
  }
}
