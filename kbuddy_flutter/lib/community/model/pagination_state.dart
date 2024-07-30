import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_state.freezed.dart';

@freezed
class PaginationState<T> with _$PaginationState<T> {
  const factory PaginationState({
    @Default([]) List<T> items,
    @Default(false) bool isLoading,
    @Default(false) bool hasReachedMax,
    Object? error,
  }) = _PaginationState;
}
