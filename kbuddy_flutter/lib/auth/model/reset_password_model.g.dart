// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_model.dart';

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
      status: json['status'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$EmailConfirmModelToJson(EmailConfirmModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

ResetPasswordModel _$ResetPasswordModelFromJson(Map<String, dynamic> json) =>
    ResetPasswordModel(
      password: json['password'] as String,
    );

Map<String, dynamic> _$ResetPasswordModelToJson(ResetPasswordModel instance) =>
    <String, dynamic>{
      'password': instance.password,
    };
