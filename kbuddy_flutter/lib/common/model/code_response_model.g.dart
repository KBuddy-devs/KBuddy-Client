// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeResponseModel _$CodeResponseModelFromJson(Map json) => CodeResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CodeResponseModelToJson(CodeResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
