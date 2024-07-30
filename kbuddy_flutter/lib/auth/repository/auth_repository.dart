import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kbuddy_flutter/auth/model/oauth_register_model.dart';
import 'package:kbuddy_flutter/auth/model/oauth_request_model.dart';
import 'package:kbuddy_flutter/common/model/base_response_model.dart';
import 'package:kbuddy_flutter/common/model/oauth_check_model.dart';

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

  Future<LoginResponse> login(
      {required String id, required String password}) async {
    // final serialized = DataUtils.plainToBase64('$id:$password');

    final resp = await dio.post('$baseurl/user/auth/login',
        data: {
          'email': id,
          'password': password,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'User-Agent':
              ' CourseMate/1.0.0 (Android 10; SM-G950U Build/R16NW) Flutter/2.2.1 Dart/2.13.0'
        }));

    logger.i(resp.data);

    return LoginResponse.fromJson(resp.data);
  }

  Future<User> kakaoHandler() async {
    final isInstalled = await isKakaoTalkInstalled();
    if (isInstalled) {
      //설치되어 있다면
      try {
        //카카오톡 로그인 시도
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        logger.i(token);
        //카카오톡 로그인
      } catch (error) {
        //error 발견하면
        logger.i(error);
      }
    } else {
      //카카오톡 설치되어 있지 않다면
      try {
        //카카오톡 계정으로 로그인 시도
        OAuthToken token =
            await UserApi.instance.loginWithKakaoAccount(); //카카오톡 계정 로그인
      } catch (error) {
        logger.i(error);
        //error 발견하면
      }
    }
    // OAuthToken token = isInstalled
    //     ? (await UserApi.instance.loginWithKakaoTalk())
    //     : (await UserApi.instance.loginWithKakaoAccount());

    User user = await UserApi.instance.me();

    return user;
    //서버에 가입된 이력이 확인하는 요청 날린다.

    //없으면 user를 파라미터로 넘겨서 화면으로 추가 정보를 받는다.

    //아니면 그냥 resp를 받아서 토큰을 저장해준다.
    // final resp = await dio.post(
    //   "$baseurl/user/auth/login",
    //   options: Options(
    //     headers: {
    //       "Authorization": "Bearer ${token.accessToken}",
    //     },
    //   ),
    // );

    // print('카카오톡으로 로그인 성공 ${token.accessToken}');

    // return DefaultResponseModel<LoginResponse>.fromJson(
    //   resp.data,
    //   LoginResponse.fromJson,
    // );
    // wa7JKdNi9PipL8LathVJyNRQIogI3vJss-5_u0AnCj1ymAAAAYbKW2pl
  }

  Future<LoginResponse> kakaoLogin(final email, final platform) async {
    final resp = await dio.post(
      "$baseurl/user/auth/oauth/login",
      data: {
        'email': email,
        'oauth': platform,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'User-Agent': 'asfd'
        },
      ),
    );
    return LoginResponse.fromJson(resp.data);
  }

  Future<OauthCheckModel> hasOauthLogin(final email, final platform) async {
    final resp = await dio.post(
      "$baseurl/user/auth/oauth/check",
      data: {
        'email': email,
        'oauth': platform,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'User-Agent': 'asfd'
        },
      ),
    );
    return OauthCheckModel.fromJson(resp.data);
  }

  Future<LoginResponse> kakaoRegister(OauthRegisterModel model) async {
    final resp = await dio.post(
      "$baseurl/user/auth/oauth/register",
      data: {
        'email': model.email,
        'oauth': model.oauth,
        'userId': model.email,
        'firstName': model.firstName,
        'lastName': model.lastName,
        'country': model.country,
        'gender': model.gender
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'User-Agent': 'asfd'
        },
      ),
    );
    return LoginResponse.fromJson(resp.data);
  }
}
