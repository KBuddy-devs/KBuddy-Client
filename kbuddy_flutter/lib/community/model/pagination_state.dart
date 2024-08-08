import 'package:freezed_annotation/freezed_annotation.dart';

import 'post_model.dart';

part 'pagination_state.freezed.dart';

@freezed
class PaginationState with _$PaginationState{
  const factory PaginationState.initial() = Initial;
  const factory PaginationState.loading() = Loading;
  const factory PaginationState.data(List<PostModel> items, bool isEnd) = Data;
  const factory PaginationState.error(String message) = Error;
}

