import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'code_response_model.g.dart';

@JsonSerializable(anyMap: true)
class CodeResponseModel {
  final bool status;
  final String message;

  CodeResponseModel({
    required this.status,
    required this.message,
  });

  factory CodeResponseModel.fromJson(Map<String, dynamic> json) {
    return CodeResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}
