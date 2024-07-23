import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kbuddy_flutter/common/utils/logger.dart';

import 'common/provider/go_router.dart';

late GoRouter globalRouter;

Future<void> main() async {
  await initializeDateFormatting('ko_KR');
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: 'bafde7003969c3c49c0f935b8ae397c3');
  logger.i('카카오 해시키 ${await KakaoSdk.origin}');
  runApp(const ProviderScope(child: Application()));
}

class Application extends ConsumerStatefulWidget {
  const Application({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Application();
}

class _Application extends ConsumerState<Application> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    globalRouter = router;

    return MaterialApp.router(
      builder: (context, child) {
        var body = MediaQuery(
          data: MediaQuery.of(context),
          child: child!,
        );
        return body;
      },
      // theme: ThemeData(
      //   fontFamily: 'Pretendard',
      //   pageTransitionsTheme: PageTransitionsTheme(
      //     builders: {
      //       TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      //       TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      //     },
      //   ),
      // ),

      // 우측 상단 debug 배너 없애기
      debugShowCheckedModeBanner: false,

      // * GoRouter 관련
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
