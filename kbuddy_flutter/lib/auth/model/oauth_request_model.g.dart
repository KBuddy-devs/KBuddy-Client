// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthCheckModel2 _$OauthCheckModel2FromJson(Map<String, dynamic> json) =>
    OauthCheckModel2(
      email: json['email'] as String,
      oauth: json['oauth'] as String,
    );

Map<String, dynamic> _$OauthCheckModel2ToJson(OauthCheckModel2 instance) =>
    <String, dynamic>{
      'email': instance.email,
      'oauth': instance.oauth,
    };

OauthLoginModel _$OauthLoginModelFromJson(Map<String, dynamic> json) =>
    OauthLoginModel(
      email: json['email'] as String,
      oauth: json['oauth'] as String,
    );

Map<String, dynamic> _$OauthLoginModelToJson(OauthLoginModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'oauth': instance.oauth,
    };
