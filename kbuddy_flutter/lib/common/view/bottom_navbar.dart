import 'package:flutter/material.dart';

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
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Community',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'My Page',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Services',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
    );
  }
}
