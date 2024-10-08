import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kbuddy_flutter/common/provider/route_provider.dart';

import '../../auth/provider/auth_provider.dart';
import '../utils/logger.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    // watch - 값이 변경될 때 마다 다시 빌드한다.
    // read - 한번만 읽고 값이 변경되도 빌드 안함

    final provider = ref.read(authProvider);
    return GoRouter(
      routes: Routes.routes,
      initialLocation: '/splash',
      redirect: provider.redirectLogic,
      refreshListenable: provider,
      // observers: [
      //   GoRouterObserver(
      //     analytics: provider.analytics,
      //   ),
      // ],
    );
  },
);

class GoRouterFunction {
  static void popUntilPath(BuildContext context, String routePath) {
    GoRouter router = GoRouter.of(context);
    logger.i(
        'route : ${router.routerDelegate.currentConfiguration.matches.last.matchedLocation}');
    logger.i('routePath : $routePath');
    while (router
            .routerDelegate.currentConfiguration.matches.last.matchedLocation !=
        routePath) {
      if (!context.canPop()) {
        return;
      }
      context.pop();
    }
  }
}
// class GoRouterObserver extends NavigatorObserver {
//   GoRouterObserver({required this.analytics});
//   final FirebaseAnalytics analytics;

//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     // 해당 user의 Id 도 같이 보내야 한다.

//     analytics.setCurrentScreen(screenName: route.settings.name);
//     print('PUSHED SCREEN: ${route.settings.name}'); //name comes back null
//   }
// }
