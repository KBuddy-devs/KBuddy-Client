import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, anyMap: true)
class DefaultResponseListModel<T> {
  final String message;
  final Map<String, dynamic> meta;
  final List<T> data;

  DefaultResponseListModel({
    required this.message,
    required this.meta,
    required this.data,
  });

  factory DefaultResponseListModel.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic> json) fromJsonT) {
    return DefaultResponseListModel<T>(
      message: json['message'] as String,
      meta: json['meta'] as Map<String, dynamic>,
      data: json['data']
          .map<T>((e) => (fromJsonT(e as Map<String, dynamic>)))
          .toList(),
    );
  }
}

@JsonSerializable(genericArgumentFactories: true, anyMap: true)
class DefaultResponseModel<T> {
  final String message;
  final Map<String, dynamic> meta;
  final T data;
  DefaultResponseModel({
    required this.message,
    required this.meta,
    required this.data,
  });
  factory DefaultResponseModel.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic> json) fromJsonT) {
    return DefaultResponseModel<T>(
      message: json['message'] as String,
      meta: json['meta'] as Map<String, dynamic>,
      data: fromJsonT(json['data'] as Map<String, dynamic>),
    );
  }
}
