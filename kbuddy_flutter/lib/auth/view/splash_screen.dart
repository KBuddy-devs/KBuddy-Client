import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/colors.dart';
import '../../common/view/default_layout.dart';
import '../../common/view/default_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // TODO: implement initState
    //  checkToken();
  }

  //이걸 redirect로직에서 UsermeProvider의 getMe가 실행되어 토큰을 확인하는 로직이 실행되고 토큰이 없을 경우에는 null을 반환하여 login화면으로 가는 로직을 실행된다.
  // void checkToken() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   final storage = ref.read(secureStroageProvider);
  //   final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
  //   final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
  //   if (refreshToken == null || accessToken == null)
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
  //   else
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //             builder: (_) => MyHomePage(
  //                   title: '1',
  //                 )),
  //         (route) => false);
  // }

  @override
  Widget build(BuildContext contex) {
    return DefaultLayout(
        backgroundColor: PRIMARY_COLOR,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/icons/init-cat.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(height: 16.0),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
