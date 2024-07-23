import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kbuddy_flutter/common/const/data.dart';
import 'package:kbuddy_flutter/common/utils/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../auth/provider/auth_provider.dart';
import '../secure_storage/secure_storage_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final storage = ref.watch(secureStroageProvider);

  dio.interceptors.add(PrettyDioLogger(
    requestBody: true,
    requestHeader: true,
    request: true,
    responseBody: true,
    responseHeader: true,
    error: true,
  ));
  dio.interceptors.add(Custominterceptor(storage: storage, ref: ref));
  return dio;
});

class Custominterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final Ref ref;

  Custominterceptor({required this.storage, required this.ref});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO: implement onRequest
    print('[REQ] [${options.method}] ${options.uri}');

    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');
      final token = await storage.read(key: ACCESS_TOKEN_KEY);
      logger.i(token);
      // 헤더 토큰을 실제 값으로 넣어준다.
      options.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'User-Agent': 'asfd'
      });
    } else {
      options.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'User-Agent':
            'CourseMate/1.0.0 (Android 10; SM-G950U Build/R16NW) Flutter/2.2.1 Dart/2.13.0'
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    print(
        '[RES] [${response.requestOptions.method} ${response.requestOptions.uri}]');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    print('[RES] [${err.requestOptions.method} ${err.requestOptions.uri}]');

    final refreshtoken = await storage.read(key: REFRESH_TOKEN_KEY);
    if (refreshtoken == null) return handler.reject(err);

    final isStatus401 = err.response?.statusCode == 401;
    // refresh토큰을 요청하는 경우인지, 만약에 이경우에 에러가 나는 거면 refresh토큰이 만료된 것이므로 로그아웃 시켜준다.
    final isPathRefresh = err.requestOptions.path == '/auth/token';
    if (isStatus401 && !isPathRefresh) {
      final dio = Dio();

      try {
        final resp = await dio.post(
          '$baseUrl/check_token',
          options: Options(
            headers: {
              'authorization': 'Bearer $refreshtoken',
            },
          ),
        );
        final accessToken = resp.data['accessToken'];
        final options = err.requestOptions;

        // 토큰 변경하기
        options.headers.addAll({
          'authorization': 'Bearer $accessToken',
        });
        storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
        final response = await dio.fetch(options);

        return handler.resolve(response);
      } on DioException catch (err) {
        // refresh토큰이 없으므로 logout을 시킨다.
        ref.read(authProvider.notifier).logout();

        return handler.reject(err);
      }
    }
    return handler.reject(err);
  }
}
