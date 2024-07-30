import 'package:freezed_annotation/freezed_annotation.dart';

part 'postbox_model.g.dart';
part 'postbox_model.freezed.dart';
@freezed
class PostBox with _$PostBox {
  factory PostBox({
    required String id,
    required String title,
    required String content,
  }) = _PostBox;

  factory PostBox.fromJson(Map<String, dynamic> json) => _$PostBoxFromJson(json);
}