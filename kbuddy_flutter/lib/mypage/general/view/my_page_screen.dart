import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/user/provider/user_me_provider.dart';

import '../../../common/view/bottom_navbar.dart';
import '../../../common/appbar/appbar_logo.dart';

class MyPageScreen extends ConsumerStatefulWidget {
  const MyPageScreen({super.key});

  @override
  ConsumerState<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends ConsumerState<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TopAppBar(),
      body: Center(
          child: GestureDetector(
        onTap: () async {
          await ref.read(userMeProvider.notifier).logout();
        },
        child: Container(
          child: Text("로그아웃"),
        ),
      )),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
