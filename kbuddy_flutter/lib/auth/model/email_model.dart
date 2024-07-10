import 'package:json_annotation/json_annotation.dart';

part 'email_model.g.dart';

@JsonSerializable()
class EmailModel {
  final String email;

  EmailModel({required this.email});

  factory EmailModel.fromJson(Map<String, dynamic> json) =>
      _$EmailModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmailModelToJson(this);
}

@JsonSerializable()
class EmailConfirmModel {
  final String email;
  final String code;

  EmailConfirmModel({required this.email, required this.code});

  factory EmailConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$EmailConfirmModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmailConfirmModelToJson(this);
}
