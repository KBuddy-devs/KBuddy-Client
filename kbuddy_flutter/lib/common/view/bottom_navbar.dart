import 'package:flutter/material.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: selectedIndex == 0 ? Image.asset('asset/bottom_nav_bar/search_active.png') : Image.asset('asset/bottom_nav_bar/search.png'),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 1 ? Image.asset('asset/bottom_nav_bar/community_active.png') : Image.asset('asset/bottom_nav_bar/community.png'),
          label: 'Community',
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 2 ? Image.asset('asset/bottom_nav_bar/services_active.png') : Image.asset('asset/bottom_nav_bar/services.png'),
          label: 'Services',
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 3 ? Image.asset('asset/bottom_nav_bar/mypage_active.png') : Image.asset('asset/bottom_nav_bar/mypage.png'),
          label: 'My Page',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: PRIMARY_COLOR,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
    );
  }
}
