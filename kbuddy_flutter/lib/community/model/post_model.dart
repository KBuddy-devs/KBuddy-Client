import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';

part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    required int id,
    String? writerId,
    required int categoryId,
    String? title,
    // required String content,
    String? description,
    required int viewCount,
    required DateTime createdAt,
    required DateTime modifiedAt,
    required bool remove,
    // List<FileModel>? file,
    @Default([]) List<FileModel>? file,
    // required List<CommentModel> comments,
    @Default([]) List<CommentModel> comments,
    required int likeCount,
    @Default([]) List<LikeModel> likes,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

@freezed
class FileModel with _$FileModel {
  const factory FileModel({
    required int id,
    required String type,
    required String url,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}

@freezed
class CommentModel with _$CommentModel {
  const factory CommentModel({
    required int id,
    required String userId,
    required int qnaId,
    required String description,
    required DateTime createdAt,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}

@freezed
class LikeModel with _$LikeModel {
  factory LikeModel({
    required String userId,
  }) = _LikeModel;

  factory LikeModel.fromJson(Map<String, dynamic> json) =>
      _$LikeModelFromJson(json);
}
