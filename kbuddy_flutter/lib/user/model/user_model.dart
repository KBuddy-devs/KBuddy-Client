import 'package:json_annotation/json_annotation.dart';

import '../../common/utils/data_utils.dart';

part 'user_model.g.dart';

abstract class UserModelBase {}

class UserModelError extends UserModelBase {
  final String message;
  UserModelError({required this.message});
}

class UserModelLoading extends UserModelBase {}

@JsonSerializable()
class UserModel extends UserModelBase {
  final int id;
  final String userId;
  final String email;
  final List<String> roles;
  final String? profileImageUrl;
  final String? bio;
  final String firstName;
  final String lastName;
  final DateTime createdDate;
  final bool? isActive;
  final String? country;
  final String? gender;

  UserModel(
      {required this.id,
      required this.userId,
      required this.email,
      required this.roles,
      this.profileImageUrl,
      this.bio,
      required this.firstName,
      required this.lastName,
      required this.createdDate,
      required this.isActive,
      required this.country,
      required this.gender});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
