import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/auth/repository/email_repository.dart';
import 'package:kbuddy_flutter/common/const/data.dart';
import 'package:kbuddy_flutter/common/dio/dio.dart';

import '../model/reset_password_model.dart';

// final emailRepositoryProvider = Provider((ref) {
//   final dio = ref.watch(dioProvider);
//   return EmailRepository(dio, baseUrl: baseUrl);
// });

class EmailState {
  final bool isEmailExist;
  final bool isLoading;
  final String verificationCode;

  EmailState({
    this.isEmailExist = false,
    this.isLoading = false,
    this.verificationCode = '',
  });

  EmailState copyWith({
    bool? isEmailExist,
    bool? isLoading,
    String? verificationCode,
  }) {
    return EmailState(
      isEmailExist: isEmailExist ?? this.isEmailExist,
      isLoading: isLoading ?? this.isLoading,
      verificationCode: verificationCode ?? this.verificationCode,
    );
  }
}

class EmailNotifier extends StateNotifier<EmailState> {
  final EmailRepository _emailRepository;

  EmailNotifier(this._emailRepository) : super(EmailState());

  Future<void> checkEmail(String email) async {
    state = state.copyWith(isLoading: true);

    try {
      final emailModel = EmailModel(email: email);
      final response =
          await _emailRepository.checkEmailExists(email: emailModel.toJson());
      state = state.copyWith(isEmailExist: response.data, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print('Error: $e');
    }
  }

  Future<void> sendCode(String email) async {
    state = state.copyWith(isLoading: true);
    try {
      final emailModel = EmailModel(email: email);
      final response = await _emailRepository.sendVerificationCode(
          email: emailModel.toJson());

      print('Response data: ${response.message}');
      if (response != null && response.message != null) {
        // message 필드만 추출
        final String verificationCode = response.message;
        state = state.copyWith(
            verificationCode: verificationCode, isLoading: false);
      } else {
        state = state.copyWith(isLoading: false);
        print('Error: Response Data is null');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print('Error: $e');
    }
  }
}

final emailProvider = StateNotifierProvider<EmailNotifier, EmailState>((ref) {
  final repository = ref.watch(emailRepositoryProvider);
  return EmailNotifier(repository);
});
