import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/view/community_screen.dart';
import '../../auth/view/my_page_screen.dart';
import '../../auth/view/search_screen.dart';
import '../../auth/view/services_screen.dart';
import '../../common/view/bottom_navbar.dart';
import '../../common/view/top_appbar.dart';

class DefaultScreen extends ConsumerStatefulWidget {
  const DefaultScreen({Key? key}) : super(key: key);

  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends ConsumerState<DefaultScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    SearchScreen(),
    CommunityScreen(),
    MyPageScreen(),
    ServicesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
