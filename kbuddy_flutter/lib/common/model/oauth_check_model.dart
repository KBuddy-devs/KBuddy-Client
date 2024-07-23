import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'oauth_check_model.g.dart';

@JsonSerializable()
class OauthCheckModel {
  final String message;
  final bool status;

  OauthCheckModel({
    required this.message,
    required this.status,
  });

  factory OauthCheckModel.fromJson(Map<String, dynamic> json) =>
      _$OauthCheckModelFromJson(json);
  Map<String, dynamic> toJson() => _$OauthCheckModelToJson(this);
}
