// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      accessTokenExpireTime: (json['accessTokenExpireTime'] as num).toInt(),
      refreshTokenExpireTime: (json['refreshTokenExpireTime'] as num).toInt(),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
      'accessTokenExpireTime': instance.accessTokenExpireTime,
      'refreshTokenExpireTime': instance.refreshTokenExpireTime,
    };
