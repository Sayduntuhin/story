import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:story_always/themes/colors.dart';
import 'package:story_always/view/widgets/custom_buttom.dart';
import '../widgets/onBordingContent.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              // First page content
              buildOnboardingContentForFastPage(
                'assets/onboardImage/slideOne.gif',
                'Welcome to',
                'Start writing the story of your life and \nleave an eternal legacy.',
              ),
              // Second page content
              buildOnboardingContent(
                'assets/onboardImage/slideTwo.png',
                'Turn your answers \ninto chapters',
                'Chat with us or AI to answer the \nquestionnaire to bring your memories to \nlife.',
              ),
              // Third page content
              buildOnboardingContent(
                'assets/onboardImage/slideThree.png',
                'Add images and customize',
                ' Make it unique add photos and design \na special cover.',
              ),
              buildOnboardingContent(
                'assets/onboardImage/slideFour.png',
                ' Start for free and discover more',
                'Create the first chapters for free and \nunlock the full book if you like it.',
              ),
            ],
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(40),
            left: ScreenUtil().setWidth(24),
            right: ScreenUtil().setWidth(24),
            child: CustomButton(text: 'Get Started', route: '/login', buttonColor: buttonColor, textColor: Colors.white)

          /*  ElevatedButton(
              onPressed: () {
              (context).go('/login');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(100),
                  vertical: ScreenUtil().setHeight(12),
                ),
                backgroundColor: buttonColor,
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                  color: Color(0xffFAF1E6),
                ),
              ),
            ),*/
          ),

          // Smooth Page Indicator Dots
          Positioned(
            bottom: ScreenUtil().setHeight(120),
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: JumpingDotEffect(
                  verticalOffset: 5,
                  dotHeight: ScreenUtil().setHeight(10),
                  dotWidth: ScreenUtil().setWidth(10),
                  activeDotColor: buttonColor,
                  dotColor: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
