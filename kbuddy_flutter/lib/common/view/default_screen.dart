import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../community/view/community_screen.dart';
import '../../mypage/general/view/my_page_screen.dart';
import '../../search/view/search_screen.dart';
import '../../services/view/services_screen.dart';
import '../../common/view/bottom_navbar.dart';
import '../appbar/appbar_logo.dart';

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
    ServicesScreen(),
    MyPageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(selectedIndex: _selectedIndex),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
