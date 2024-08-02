import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';

part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    required String id,
    required String writerId,
    required String categoryId,
    required String title,
    required String content,
    required int viewCount,
    required DateTime createdAt,
    required DateTime modifiedAt,
    required bool remove,
    required List<FileModel> file,
    required List<CommentModel> comments,
    required int likes,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

@freezed
class FileModel with _$FileModel {
  const factory FileModel({
    required int id,
    required String type,
    required String name,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required int id,
    required int qnaId,
    required String writerId,
    required String description,
    required bool remove,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
