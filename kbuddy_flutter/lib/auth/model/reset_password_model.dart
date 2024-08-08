import 'package:json_annotation/json_annotation.dart';

part 'reset_password_model.g.dart';

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
  final bool status;
  final String message;

  EmailConfirmModel({required this.status, required this.message});

  factory EmailConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$EmailConfirmModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmailConfirmModelToJson(this);
}

@JsonSerializable()
class ResetPasswordModel {
  final String password;

  ResetPasswordModel({required this.password});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordModelToJson(this);
}
