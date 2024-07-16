import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/utils/logger.dart';
import '../../user/model/user_model.dart';
import '../../user/provider/user_me_provider.dart';

final authProvider = ChangeNotifierProvider((ref) {
  return AuthProvider(ref: ref);
});

class AuthProvider extends ChangeNotifier {
  final Ref ref;

  AuthProvider({required this.ref}) {
    ref.listen<UserModelBase?>(userMeProvider, (previous, next) {
      if (previous != next) {
        print('previous: $previous, next: $next');
        notifyListeners();
      }
    });
  }

  void logout() {
    ref.read(userMeProvider.notifier).logout();
  }

  String? redirectLogic(BuildContext context, GoRouterState state) {
    print('redirect시작');
    return '/login';
    final UserModelBase? user = ref.read(userMeProvider);
    print(user);
    // 로그인 화면의 상태인 경우
    final loggin = state.uri.toString() == '/community';

    //유저 정보가 없는데 로그인화면 상태일때
    if (user == null) {
      return loggin ? null : '/login';  
    }
    //사용자 정보 존재
    if (user is UserModel) {
      logger.e('user : $user');
      return '/';
      // return loggin || state.uri.toString() == '/login' ? '/community' : '/login';
    }
    if (user is UserModelError) {
      return !loggin ? '/login' : null;
    }

    return null;
  }
}
