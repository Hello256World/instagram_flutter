import 'package:flutter/material.dart';
import 'package:instagram_flutter/constants/constants.dart';
import 'package:instagram_flutter/screens/activity_screen.dart';
import 'package:instagram_flutter/screens/add_content.dart';
import 'package:instagram_flutter/screens/home_screen.dart';
import 'package:instagram_flutter/screens/search_screen.dart';
import 'package:instagram_flutter/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomIndex = 0;
  List<Widget> screensList = [
    HomeScreen(),
    SearchScreen(),
    AddContent(),
    ActivityScreen(),
    UserProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: blackColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _bottomIndex,
        onTap: (value) {
          setState(() {
            _bottomIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_home.png'),
            label: 'item',
            activeIcon: Image.asset('images/icon_active_home.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_search_navigation.png'),
            label: 'item',
            activeIcon: Image.asset('images/icon_search_navigation_active.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_add_navigation.png'),
            label: 'item',
            activeIcon: Image.asset('images/icon_add_navigation_active.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_activity_navigation.png'),
            label: 'item',
            activeIcon:
                Image.asset('images/icon_activity_navigation_active.png'),
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: greyColor,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  'images/user.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            activeIcon: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: pinkColor,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  'images/user.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            label: 'item',
          ),
        ],
      ),
      body: IndexedStack(
        index: _bottomIndex,
        children: screensList,
      ),
    );
  }
}
