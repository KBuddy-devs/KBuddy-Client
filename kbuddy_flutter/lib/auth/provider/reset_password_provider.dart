import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/auth/model/reset_password_model.dart';
import 'package:kbuddy_flutter/auth/repository/reset_password_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/utils/logger.dart';

part 'reset_password_provider.g.dart';

@riverpod
class ResetPassword extends _$ResetPassword {
  @override
  // Future<EmailConfirmModel> build() {
  //   return null;
  // }
  EmailConfirmModel? build() {
    return null;
  }

  Future<void> sendEmail(EmailModel emailModel) async {
    final repository = ref.read(resetPasswordRepositoryProvider);
    logger.e('emailmodel : ${emailModel.toJson().toString()}');
    final resp =
        await repository.sendPasswordResetEmail(emailModel: emailModel);
    // state = resp.message;
    logger.e('state : $state');
    // return state;
  }

  Future<void> sendNewPassword(ResetPasswordModel resetPasswordModel) async {
    final repository = ref.read(resetPasswordRepositoryProvider);
    logger.e('resetPasswordModel : ${resetPasswordModel.toJson().toString()}');
    final resp = await repository.sendNewPassword(
        resetPasswordModel: resetPasswordModel);
    state = resp.message;
    logger.e('state : $state');
    // return state;
  }

  // ...
}
