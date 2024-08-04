import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/post_model.dart';

part 'pagination_response.freezed.dart';
part 'pagination_response.g.dart';
@freezed
class PaginationResponse with _$PaginationResponse {
  const factory PaginationResponse({
    required String timestamp,
    required int status,
    required String code,
    required String path,
    required Message message,
}) = _PaginationResponse;
      factory PaginationResponse.fromJson(Map<String, dynamic> json) => _$PaginationResponseFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    required int count,
    required String? next,
    required String? previous,
    // @Default([]) List<PostModel> results,
    required List<PostModel> results,
}) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}