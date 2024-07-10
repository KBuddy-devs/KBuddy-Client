import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/auth/model/email_model.dart';
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
  Future<DefaultResponseModel<EmailConfirmModel>> sendPasswordResetEmail({
    @Body() required EmailModel emailModel,
  });
}
