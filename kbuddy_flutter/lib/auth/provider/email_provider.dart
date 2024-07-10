import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/auth/repository/email_repository.dart';

final emailRepositoryProvider = Provider((ref) => EmailRepository());

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

    try{
      final isEmailExist = await _emailRepository.checkEmailExists(email);
      state = state.copyWith(isEmailExist: isEmailExist, isLoading: false);
    }catch(e){
      state = state.copyWith(isLoading: false);
      print('Error: $e');
    }
  }
  Future<void> sendCode(String email) async{
    state = state.copyWith(isLoading: true);
    try{
      final verificationCode = await _emailRepository.sendVerificationCode(email);
      state = state.copyWith(verificationCode: verificationCode, isLoading: false);
    }catch(e){
      state = state.copyWith(isLoading: false);
      print('Error: $e');
    }
  }
}

final emailProvider = StateNotifierProvider<EmailNotifier,EmailState>((ref){
  final repository = ref.watch(emailRepositoryProvider);
  return EmailNotifier(repository);
});

