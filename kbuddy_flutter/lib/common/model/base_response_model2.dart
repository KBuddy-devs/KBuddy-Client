import 'package:json_annotation/json_annotation.dart';

import '../utils/logger.dart';

part 'base_response_model2.g.dart';

@JsonSerializable(genericArgumentFactories: true, anyMap: true)
class DefaultResponseListModel2<T> {
  final String message;
  final Map<String, dynamic> meta;
  final List<T> data;

  DefaultResponseListModel2({
    required this.message,
    required this.meta,
    required this.data,
  });

  factory DefaultResponseListModel2.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic> json) fromJsonT) {
    return DefaultResponseListModel2<T>(
      message: json['message'] as String,
      meta: json['meta'] as Map<String, dynamic>,
      data: json['data']
          .map<T>((e) => (fromJsonT(e as Map<String, dynamic>)))
          .toList(),
    );
  }
}

@JsonSerializable()
class DefaultResponseModel2<T> {
  final String timestamp;
  final int status;
  final String code;
  final String path;
  final Map<String, dynamic> message;
  DefaultResponseModel2({
    required this.timestamp,
    required this.status,
    required this.code,
    required this.path,
    required this.message,
  });
  factory DefaultResponseModel2.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseModel2FromJson(json);
  Map<String, dynamic> toJson() => _$DefaultResponseModel2ToJson(this);
}

// @JsonSerializable(genericArgumentFactories: true, anyMap: true)
// class DefaultResponseModel<T> {
//   final String message;
//   final Map<String, dynamic> meta;
//   final T data;
//   DefaultResponseModel({
//     required this.message,
//     required this.meta,
//     required this.data,
//   });
//   factory DefaultResponseModel.fromJson(Map<String, dynamic> json,
//       T Function(Map<String, dynamic> json) fromJsonT) {
//     return DefaultResponseModel<T>(
//       message: json['message'] as String,
//       meta: json['meta'] as Map<String, dynamic>,
//       data: fromJsonT(json['data'] as Map<String, dynamic>),
//     );
//   }
// }
