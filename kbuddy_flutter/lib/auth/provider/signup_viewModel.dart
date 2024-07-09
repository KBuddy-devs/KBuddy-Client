import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/password_validator.dart';

const List<String> countryList = [
  'United States',
  'United Kingdom',
  'Canada',
  'Australia',
  'New Zealand',
  'Ireland',
  'China',
  'Japan',
  'India',
  'South Africa',
  'Singapore',
  'Germany',
  'France',
  'Italy',
  'Spain',
  'Russia',
  'Brazil',
  'Mexico',
  'South Korea',
  'Ukraine',
  'Netherlands',
  'Sweden',
  'Switzerland',
  'Poland',
  'Turkey',
  'Egypt',
  'Israel',
  'Saudi Arabia',
  'United Arab Emirates',
  'Thailand'
];

// 상태 모음
class SignUpState {
  final String? selectedCountry;
  final String? username;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final bool isFormValid;

  //final UserModel? userModel; // 유저 데이터 모델

  SignUpState({
    this.selectedCountry,
    this.username,
    this.email,
    this.password,
    this.confirmPassword,
    this.isPasswordValid = false,
    this.isConfirmPasswordValid = false,
    this.isFormValid = false,
    //this.userModel,
  });

  SignUpState copyWith({
    String? selectedCountry,
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    bool? isFormValid,
    //UserModel? userModel,
  }) {
    return SignUpState(
      // 불변 객체 update + 일부 update 가능한 패턴으로 작성
      selectedCountry: selectedCountry ?? this.selectedCountry,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid:
          isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      isFormValid: isFormValid ?? this.isFormValid,
      //userModel: userModel ?? this.userModel,
    );
  }
}

// 상태에 연관된 메서드 모음
// 이 클래스 에서는 상태를 인자로 가진다.
class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel(super.state);

  //SignUpViewModel() : super(SignUpState());

  List<String> get countries => countryList;

  // 개인 정보를 각각 Update 하는 메서드
  void selectCountry(String country) {
    state = state.copyWith(selectedCountry: country);
  }

  void updateUsername(String username){
    state = state.copyWith(username: username);
    _updateFormValidity();
  }

  void updateEmail(String email){
    state = state.copyWith(email: email);
    _updateFormValidity();
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
    _updatePasswordValidity();
  }

  void updateConfirmPassword(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
    _updateConfirmPasswordValidity(confirmPassword);
  }

  // 유효성 Update 하는 메서드
  void _updatePasswordValidity() {
    bool isPasswordValid = PasswordValidator.hasMinLength(state.password!) &&
        (PasswordValidator.hasUpperCase(state.password!) ||
            (PasswordValidator.hasLowerCase(state.password!) &&
                PasswordValidator.hasDigit(state.password!))) &&
        PasswordValidator.hasUpperCase(state.password!) &&
        PasswordValidator.hasSpecialChar(state.password!) &&
        PasswordValidator.isMaxLength(state.password!);

    state = state.copyWith(isPasswordValid: isPasswordValid);
    _updateFormValidity();
  }

  void _updateConfirmPasswordValidity(String confirmPassword) {
    bool isConfirmPasswordValid = PasswordValidator.passwordsMatch(
        state.password!, state.confirmPassword!);
    state = state.copyWith(isConfirmPasswordValid: isConfirmPasswordValid);
    _updateFormValidity();
  }

  void _updateFormValidity() {
    bool isFormValid = state.username != null &&
        state.email != null &&
        state.isPasswordValid &&
        state.isConfirmPasswordValid;
    state = state.copyWith(
        isFormValid: isFormValid);
  }
}

final signUpProvider = StateNotifierProvider<SignUpViewModel, SignUpState>(
  (ref) => SignUpViewModel(SignUpState()),
);
