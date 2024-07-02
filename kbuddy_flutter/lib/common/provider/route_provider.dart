import 'package:go_router/go_router.dart';
import 'package:kbuddy_flutter/auth/view/login_screen.dart';

import '../../auth/view/splash_screen.dart';
import '../../community/view/community_screen.dart';
import '../view/default_screen.dart';

List<GoRoute> get routes => [
      GoRoute(
        path: '/',
        name: 'root',
        builder: (context, state) => const DefaultScreen(),
      ),
      GoRoute(
        path: '/community',
        name: 'community',
        builder: (context, state) => const CommunityScreen(),
      ),
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
    ];
