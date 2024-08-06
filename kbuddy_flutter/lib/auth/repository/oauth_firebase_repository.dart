import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/auth/model/oauth_request_model.dart';
import 'package:kbuddy_flutter/common/model/base_response_model2.dart';
import 'package:kbuddy_flutter/common/model/login_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../common/const/data.dart';
import '../../common/dio/dio.dart';
import '../model/reset_password_model.dart';

part 'oauth_firebase_repository.g.dart';

final oauthFirebaseRepositoryProvider =
    Provider<OauthFirebaseRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return OauthFirebaseRepository(dio, baseUrl: baseUrl);
});

@RestApi()
abstract class OauthFirebaseRepository {
  factory OauthFirebaseRepository(Dio dio, {String baseUrl}) =
      _OauthFirebaseRepository;
  // @Headers({'accessToken': 'false'})
  // emailconfirmmodel -> 임시로 defaultBaseModel 쓰기 전까지만 사용하는 용도
  // 수정 중
  @POST('/user/auth/oauth/check')
  Future<DefaultResponseModel2> oauthCheck({
    @Body() required OauthCheckModel2 oauthCheckModel2,
  });

  @POST('/user/auth/oauth/login')
  Future<LoginResponse> oauthLogin({
    @Body() required OauthLoginModel oauthLoginModel,
  });
}
