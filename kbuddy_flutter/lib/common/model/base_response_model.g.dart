// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultResponseListModel<T> _$DefaultResponseListModelFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    DefaultResponseListModel<T>(
      message: json['message'] as String,
      meta: Map<String, dynamic>.from(json['meta'] as Map),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$DefaultResponseListModelToJson<T>(
  DefaultResponseListModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'meta': instance.meta,
      'data': instance.data.map(toJsonT).toList(),
    };
