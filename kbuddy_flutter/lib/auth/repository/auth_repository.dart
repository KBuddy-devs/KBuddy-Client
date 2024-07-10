import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/data.dart';
import '../../common/dio/dio.dart';
import '../../common/model/login_response.dart';
import '../../common/utils/data_utils.dart';
import '../../common/utils/logger.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(dioProvider);
  return AuthRepository(baseurl: baseUrl, dio: dio);
});

// 로그인 api함수를 사용하여 토큰을 발급받는다. 발급받은 후 반환
class AuthRepository {
  final String baseurl;
  final Dio dio;

  AuthRepository({required this.baseurl, required this.dio});

  Future<LoginResponse> login({required String id, required String password}) async {
    // final serialized = DataUtils.plainToBase64('$id:$password');

    final resp = await dio.post('$baseurl/login',
        data: {
          'userId': id,
          'password': password,
        },
        options: Options(headers: {
          'Authorization': 'authorization',
          'content-type': 'application/x-www-form-urlencoded',
        }));

    logger.i(resp.data);

    return LoginResponse.fromJson(resp.data);
  }

}
