import 'package:go_router/go_router.dart';
import 'package:story_always/view/home/pages/home_page.dart';
import 'package:story_always/view/order/page/order_page.dart';
import 'package:story_always/view/subscription/pages/subcriptions_page.dart';
import 'package:story_always/view/widgets/custom_navigation_bar.dart';
import '../view/forgetPassword/pages/forget_password_page.dart';
import '../view/languageChoose/pages/choose_language_page.dart';
import '../view/login/pages/login_page.dart';
import '../view/onboardScreen/pages/onboarding_screen.dart';
import '../view/resetPassword/pages/reset_password_page.dart';
import '../view/setting/pages/setting_page.dart';
import '../view/signUp/pages/signUP_page.dart';
import '../view/verifycation_code/pages/verifications_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnboardingPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/forget-password',
      builder: (context, state) => ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/verify-code',
      builder: (context, state) => OTPVerificationPage(),
    ),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) => ResetPasswordPage(),
    ),
    GoRoute(
      path: '/create-account',
      builder: (context, state) => CreateAccountPage(),
    ),
    GoRoute(
      path: '/language',
      builder: (context, state) => LanguageSelectionPage(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/setting',
      builder: (context, state) => SettingsPage(),
    ),
    GoRoute(
      path: '/subscription',
      builder: (context, state) => UpgradePage(),
    ),  GoRoute(
      path: '/order',
      builder: (context, state) => OrderPage(),
    ),
  ],
);
