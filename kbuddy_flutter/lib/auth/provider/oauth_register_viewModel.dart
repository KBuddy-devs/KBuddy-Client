
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/oauth_register_model.dart';

part 'oauth_register_viewModel.g.dart';

@riverpod
class OauthRegisterViewModel extends _$OauthRegisterViewModel {
  @override
  OauthRegisterModel build() {
    return OauthRegisterModel(
      email: '',
      oauth: '',
      userId: '',
      country: '',
      firstName: '',
      gender: '',
      lastName: '',
    );
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateOauth(String oauth) {
    state = state.copyWith(oauth: oauth);
  }

  void updateUserId(String userId) {
    state = state.copyWith(userId: userId);
  }

  void updateFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void updateLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void updateCountry(String country) {
    state = state.copyWith(country: country);
  }

  void updateGender(String gender) {
    state = state.copyWith(gender: gender);
  }

  void updaateFormValidatity(){
    bool isFormValid = state.firstName != '' &&
    state.lastName != '' &&
    state.userId != ''  &&
    state.country != ''&&
    state.email != '';
  }
  // Future<void> kakaoRegister(OauthRegisterModel model) async {}
}
