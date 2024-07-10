// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailModel _$EmailModelFromJson(Map<String, dynamic> json) => EmailModel(
      email: json['email'] as String,
    );

Map<String, dynamic> _$EmailModelToJson(EmailModel instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

EmailConfirmModel _$EmailConfirmModelFromJson(Map<String, dynamic> json) =>
    EmailConfirmModel(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$EmailConfirmModelToJson(EmailConfirmModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
