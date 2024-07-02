import 'package:flutter/material.dart';

import '../../common/view/bottom_navbar.dart';
import '../../common/view/top_appbar.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: TopAppBar(),
      body: Center(child: Text('my page screen')),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
