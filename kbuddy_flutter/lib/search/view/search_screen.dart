import 'package:flutter/material.dart';
import 'package:kbuddy_flutter/common/view/bottom_navbar.dart';
import 'package:kbuddy_flutter/common/view/top_appbar.dart';
import 'package:kbuddy_flutter/mypage/general/view/post_qna_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TopAppBar(),
      body: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostQnaScreen()),
                );
              },
              child: Text('search screen'))),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
