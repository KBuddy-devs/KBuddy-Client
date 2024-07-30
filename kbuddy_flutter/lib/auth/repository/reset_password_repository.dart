import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/auth/model/reset_password_model.dart';
import 'package:kbuddy_flutter/auth/provider/reset_password_provider.dart';
import 'package:retrofit/retrofit.dart';

import '../../common/const/data.dart';
import '../../common/dio/dio.dart';
import '../../common/model/base_response_model.dart';

part 'reset_password_repository.g.dart';

final resetPasswordRepositoryProvider =
    Provider<ResetPasswordRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ResetPasswordRepository(dio, baseUrl: baseUrl);
});

@RestApi()
abstract class ResetPasswordRepository {
  factory ResetPasswordRepository(Dio dio, {String baseUrl}) =
      _ResetPasswordRepository;

  @POST('/user/auth/email/send')
  // @Headers({'accessToken': 'false'})
  // Future<EmailConfirmModel> sendPasswordResetEmail({
  Future<EmailConfirmModel> sendPasswordResetEmail({
    @Body() required EmailModel emailModel,
  });

  @POST('/user/auth/password')
  // @Headers({'accessToken': 'false'})
  // Future<EmailConfirmModel> sendPasswordResetEmail({
  Future<EmailConfirmModel> sendNewPassword({
    @Body() required ResetPasswordModel resetPasswordModel,
  });
}
