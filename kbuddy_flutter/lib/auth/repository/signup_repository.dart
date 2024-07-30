
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/auth/model/auth_response.dart';
import 'package:retrofit/http.dart';

import '../../common/const/data.dart';
import '../../common/dio/dio.dart';
import '../../user/model/user_model.dart';

part 'signup_repository.g.dart';

final signupRepositoryProvider = Provider<SignupRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return SignupRepository(dio, baseUrl: baseUrl);
});

@RestApi(baseUrl: baseUrl)
abstract class SignupRepository {
  factory SignupRepository(Dio dio, {String baseUrl}) = _SignupRepository;
  
  @POST('/user/auth/register')
  Future<AuthResponse> signUp({
    @Body() required Map<String, dynamic> body,
    //@Header("Authorization") required String authorization,
    //@Header("User-Agent") required String userAgent
  });

}