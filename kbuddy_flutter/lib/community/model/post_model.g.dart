// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      id: json['id'] as String,
      writerId: json['writerId'] as String,
      categoryId: json['categoryId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      viewCount: (json['viewCount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      modifiedAt: DateTime.parse(json['modifiedAt'] as String),
      remove: json['remove'] as bool,
      file: (json['file'] as List<dynamic>)
          .map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      likes: (json['likes'] as num).toInt(),
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'writerId': instance.writerId,
      'categoryId': instance.categoryId,
      'title': instance.title,
      'content': instance.content,
      'viewCount': instance.viewCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'modifiedAt': instance.modifiedAt.toIso8601String(),
      'remove': instance.remove,
      'file': instance.file,
      'comments': instance.comments,
      'likes': instance.likes,
    };

_$FileModelImpl _$$FileModelImplFromJson(Map<String, dynamic> json) =>
    _$FileModelImpl(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$FileModelImplToJson(_$FileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
    };

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      id: (json['id'] as num).toInt(),
      qnaId: (json['qnaId'] as num).toInt(),
      writerId: json['writerId'] as String,
      description: json['description'] as String,
      remove: json['remove'] as bool,
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'qnaId': instance.qnaId,
      'writerId': instance.writerId,
      'description': instance.description,
      'remove': instance.remove,
    };
