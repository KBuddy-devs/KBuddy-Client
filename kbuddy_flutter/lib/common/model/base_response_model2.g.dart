// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultResponseListModel2<T> _$DefaultResponseListModel2FromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    DefaultResponseListModel2<T>(
      message: json['message'] as String,
      meta: Map<String, dynamic>.from(json['meta'] as Map),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$DefaultResponseListModel2ToJson<T>(
  DefaultResponseListModel2<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'meta': instance.meta,
      'data': instance.data.map(toJsonT).toList(),
    };

DefaultResponseModel2<T> _$DefaultResponseModel2FromJson<T>(
        Map<String, dynamic> json) =>
    DefaultResponseModel2<T>(
      timestamp: json['timestamp'] as String,
      status: (json['status'] as num).toInt(),
      code: json['code'] as String,
      path: json['path'] as String,
      message: json['message'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$DefaultResponseModel2ToJson<T>(
        DefaultResponseModel2<T> instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'status': instance.status,
      'code': instance.code,
      'path': instance.path,
      'message': instance.message,
    };
