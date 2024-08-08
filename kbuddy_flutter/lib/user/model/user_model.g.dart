// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num).toInt(),
      userId: json['userId'] as String,
      email: json['email'] as String,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      profileImageUrl: json['profileImageUrl'] as String?,
      bio: json['bio'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      isActive: json['isActive'] as bool?,
      country: json['country'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'email': instance.email,
      'roles': instance.roles,
      'profileImageUrl': instance.profileImageUrl,
      'bio': instance.bio,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'createdDate': instance.createdDate.toIso8601String(),
      'isActive': instance.isActive,
      'country': instance.country,
      'gender': instance.gender,
    };
