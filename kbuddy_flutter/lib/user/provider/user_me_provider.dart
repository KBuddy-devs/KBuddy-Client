import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../auth/repository/auth_repository.dart';
import '../../common/const/data.dart';
import '../../common/secure_storage/secure_storage_provider.dart';
import '../../common/utils/logger.dart';
import '../model/user_model.dart';
import '../repository/user_me_repository.dart';

final userMeProvider =
    StateNotifierProvider<UserMeStateNotifier, UserModelBase?>((ref) {
  final userMeRepository = ref.watch(userMeRepositoryProvider);
  final storage = ref.watch(secureStroageProvider);
  final authRepository = ref.watch(authRepositoryProvider);

  return UserMeStateNotifier(
      repo: userMeRepository, storage: storage, authRepo: authRepository);
});

class UserMeStateNotifier extends StateNotifier<UserModelBase?> {
  final UserMeRepository repo;
  final FlutterSecureStorage storage;
  final AuthRepository authRepo;

  UserMeStateNotifier(
      {required this.repo, required this.storage, required this.authRepo})
      : super(UserModelLoading()) {
    getMe();
  }

  // 임시 테스트용
  Future<void> getMe() async {
    // await storage.delete(key: ACCESS_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    await Future.delayed(const Duration(seconds: 1));

    logger.e('token : $accessToken');

    if (accessToken == null) {
      state = null;
      return;
    }
    UserModel userTmp = UserModel(
      id: 'test',
      role: 'testname',
    );
    state = userTmp;
  }

  // Future<void> getMe() async {
  //   final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
  //   final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
  //   await Future.delayed(const Duration(seconds: 1));

  //   if (refreshToken == null || accessToken == null) {
  //     state = null;
  //     return;
  //   }
  //   final res = await repo.getMe();
  //   state = res;
  // }

  Future<UserModelBase> login(String id, String password) async {
    try {
      // logger.e('id : $id, password : $password');
      state = UserModelLoading();
      // 토큰을 우선 서버로 부터 받아와서 스토리지에 저장한다.
      logger.e('start');
      final resp = await authRepo.login(id: id, password: password);
      logger.e('response : $resp');

      // await storage.write(key: REFRESH_TOKEN_KEY, value: resp.refreshToken);
      await storage.write(key: ACCESS_TOKEN_KEY, value: resp.accessToken);
      // 그리고 내 정보인 UserModel을 받아온다.
      // final userRes = await repo.getMe();
      // state = userRes;
      // return userRes;
      UserModel userTmp = UserModel(id: id, role: id);
      logger.e('end');
      state = userTmp;
      return userTmp;
    } catch (e) {
      state = null;
      logger.e('error : $e');

      return UserModelError(message: '로그인 실패');
    }
  }

  Future<void> logout() async {
    state = null;

    await Future.wait(
      [
        storage.delete(key: REFRESH_TOKEN_KEY),
        storage.delete(key: ACCESS_TOKEN_KEY),
      ],
    );
  }
}
