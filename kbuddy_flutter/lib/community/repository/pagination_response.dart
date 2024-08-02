import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/post_model.dart';

part 'pagination_response.freezed.dart';
part 'pagination_response.g.dart';
@freezed
class PaginationResponse with _$PaginationResponse {
  const factory PaginationResponse({
    required int count,
    required String? next,
    required String? previous,
    required List<PostModel> result,
}) = _PaginationResponse;
      factory PaginationResponse.fromJson(Map<String, dynamic> json) => _$PaginationResponseFromJson(json);
}