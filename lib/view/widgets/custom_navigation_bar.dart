import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home/pages/home_page.dart';
import '../profile/pages/profile_page.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Track the selected index for navigation

  // List of pages
  final List<Widget> _pages = [
     HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the selected page based on currentIndex
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex, // Pass the current index to the navigation bar
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Current selected index
      onTap: onTap, // When an item is tapped, update the currentIndex
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/isNotSelectedHome.png', width: 22.w),
          activeIcon: Image.asset('assets/icons/isSelectedHome.png', width: 22.w),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/isNotSelectedBook.png', width: 30.w),
          activeIcon: Image.asset('assets/icons/isSelectedBook.png', width: 30.w),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons/isNotSelectedProfile.png', width: 22.w),
          activeIcon: Image.asset('assets/icons/isSelectedProfile.png', width: 22.w),
          label: '',
        ),
      ],
    );
  }
}
