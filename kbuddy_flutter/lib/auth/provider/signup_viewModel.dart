import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/auth/repository/signup_repository.dart';

import '../../common/utils/password_validator.dart';
import '../../user/model/user_model.dart';

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
  final String? code;
  final String? firstName;
  final String? lastName;
  final String? sex;
  final String? selectedCountry;
  final String? username;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final bool isFormValid;
  final bool isCodeBoxValid;
  final bool isCodeValid;

  final UserModel? userModel; // 유저 데이터 모델

  SignUpState({
    this.code,
    this.selectedCountry,
    this.firstName,
    this.lastName,
    this.sex,
    this.username,
    this.email,
    this.password,
    this.confirmPassword,
    this.isPasswordValid = false,
    this.isConfirmPasswordValid = false,
    this.isFormValid = false,
    this.isCodeBoxValid = false,
    this.isCodeValid = false,
    this.userModel,
  });

  SignUpState copyWith({
    String? code,
    String? selectedCountry,
    String? firstName,
    String? lastName,
    String? sex,
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    bool? isFormValid,
    bool? isCodeBoxValid,
    bool? isCodeValid,
    UserModel? userModel,
  }) {
    return SignUpState(
      // 불변 객체 update + 일부 update 가능한 패턴으로 작성
      code: code ?? this.code,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      sex: sex ?? this.sex,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid:
          isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      isFormValid: isFormValid ?? this.isFormValid,
      isCodeBoxValid: isCodeBoxValid ?? this.isCodeBoxValid,
      isCodeValid: isCodeValid ?? this.isCodeValid,
      userModel: userModel ?? this.userModel,
    );
  }
}

// 상태에 연관된 메서드 모음
// 이 클래스 에서는 상태를 인자로 가진다.
class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel(super.state) {
    final dio = Dio();
    _signupApi = SignupRepository(dio);
  }

  // Dio -> _signupApi 초기화 해야 함.
  // 생성자 내부에서 진행 -> 변수 즉시 초기화 불가.
  // 따라서 late 사용.
  late SignupRepository _signupApi;

  //SignUpViewModel() : super(SignUpState());

  List<String> get countries => countryList;

  void updateCode(String code) {
    state = state.copyWith(code: code);
    _updateCodeBoxValidity();
  }

  // 개인 정보를 각각 Update 하는 메서드
  void updateSex(String sex) {
    state = state.copyWith(sex: sex);
  }

  void updateFirstName(String name) {
    state = state.copyWith(firstName: name);
    _updateFormValidity();
  }

  void updateLastName(String name) {
    state = state.copyWith(lastName: name);
    _updateFormValidity();
  }

  void selectCountry(String country) {
    state = state.copyWith(selectedCountry: country);
  }

  void updateUsername(String username) {
    state = state.copyWith(username: username);
    _updateFormValidity();
  }

  void updateEmail(String email) {
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
  void _updateCodeBoxValidity() {
    bool isCodeBoxValid = state.code != null;
    state = state.copyWith(isCodeBoxValid: isCodeBoxValid);
  }

  void _updateCodeValidity() {
    state = state.copyWith(isCodeValid: state.isCodeValid);
  }

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
    bool isFormValid = state.firstName != null &&
        state.lastName != null &&
        state.email != null &&
        state.isPasswordValid &&
        state.isConfirmPasswordValid;
    state = state.copyWith(isFormValid: isFormValid);
  }

  Future<void> signUp() async {
    if (state.isFormValid) {
      try {
        final response = await _signupApi.signUp(body: {
          'email': state.email!,
          'password': state.password!,
          'userId': state.username!,
          'firstName': state.firstName,
          'lastName': state.lastName,
          'country': state.selectedCountry!,
          //'sex': state.sex,
          'sex': 'male',
        });
        state = state.copyWith(userModel: response);
        print('Signup Success: $response');
      } catch (e) {
        print('Signup Error: $e');
      }
    }
  }
}

final signUpProvider = StateNotifierProvider<SignUpViewModel, SignUpState>(
  (ref) => SignUpViewModel(SignUpState()),
);
