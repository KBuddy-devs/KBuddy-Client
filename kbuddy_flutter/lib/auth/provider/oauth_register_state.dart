import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/oauth_register_model.dart';

part 'oauth_register_state.g.dart';
@riverpod
class OauthRegisterState extends _$OauthRegisterState {
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
}
