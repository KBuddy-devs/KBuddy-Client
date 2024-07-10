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
  final String id;
  final String role;
  final String? email;
  final String? phoneNumber;
  final String? nickname;
  final DateTime? createdAt;
  final bool? quit;
  final String? country;
  final String? sex;
  final String? introduce;
  final int? point;
  final dynamic? profileImage;
  final int? followers;
  final int? followings;

  UserModel({
    required this.id,
    required this.role,
    this.email,
    this.phoneNumber,
    this.nickname,
    this.createdAt,
    this.quit,
    this.country,
    this.sex,
    this.introduce,
    this.point,
    this.profileImage,
    this.followers,
    this.followings,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
