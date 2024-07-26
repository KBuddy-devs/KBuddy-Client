import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required String id,
    required String author,
    required String date,
    required String title,
    required String content,
    required String imageUrl,
    required int likes,
    required int comments,
  }) = _Post;
  factory Post.fromJson(Map<String, dynamic>json) => _$PostFromJson(json);
}
