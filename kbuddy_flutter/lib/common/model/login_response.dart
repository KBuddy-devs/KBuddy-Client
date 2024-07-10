import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

// 임시 테스트용
// @JsonSerializable()
// class LoginResponse {
//   final int status;
//   final String accessToken;
//   final String message;

//   LoginResponse({
//     required this.status,
//     required this.accessToken,
//     required this.message,
//   });

//   factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
// }

@JsonSerializable()
class LoginResponse {
  final String refreshToken;
  final String accessToken;

  LoginResponse({required this.accessToken, required this.refreshToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
