// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthCheckModel _$OauthCheckModelFromJson(Map<String, dynamic> json) =>
    OauthCheckModel(
      message: json['message'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$OauthCheckModelToJson(OauthCheckModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
