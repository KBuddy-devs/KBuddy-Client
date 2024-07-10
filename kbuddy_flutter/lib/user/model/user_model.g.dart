// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      role: json['role'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      nickname: json['nickname'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      quit: json['quit'] as bool?,
      country: json['country'] as String?,
      sex: json['sex'] as String?,
      introduce: json['introduce'] as String?,
      point: (json['point'] as num?)?.toInt(),
      profileImage: json['profileImage'],
      followers: (json['followers'] as num?)?.toInt(),
      followings: (json['followings'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'nickname': instance.nickname,
      'createdAt': instance.createdAt?.toIso8601String(),
      'quit': instance.quit,
      'country': instance.country,
      'sex': instance.sex,
      'introduce': instance.introduce,
      'point': instance.point,
      'profileImage': instance.profileImage,
      'followers': instance.followers,
      'followings': instance.followings,
    };
