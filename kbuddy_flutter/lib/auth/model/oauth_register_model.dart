import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class OauthRegisterModel {
  final String email;
  final String oauth;
  final String userId;
  final String firstName;

  final String lastName;
  final String country;
  final String gender;

  OauthRegisterModel(
      {required this.email,
      required this.oauth,
      required this.userId,
      required this.country,
      required this.firstName,
      required this.gender,
      required this.lastName});
}
