import 'package:flutter/material.dart';
import 'package:kbuddy_flutter/common/view/bottom_navbar.dart';
import 'package:kbuddy_flutter/common/appbar/appbar_logo.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: TopAppBar(),
      body: Center(child: Text('search screen')),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
