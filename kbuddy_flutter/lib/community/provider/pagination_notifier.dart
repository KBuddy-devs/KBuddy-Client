import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/community/model/pagination_state.dart';

class PaginationNotifier<T> extends StateNotifier<PaginationState<T>> {
  Future<List<T>> Function(int offset)? fetchItems;

  PaginationNotifier({this.fetchItems}) : super(PaginationState<T>());

  Future<void> loadMoreItems() async {
    if (state.isLoading || state.hasReachedMax) return;
    if (fetchItems == null) throw Exception('fetchItems function must be set before calling loadMoreItems');

    state = state.copyWith(isLoading: true);
    try {
      final newItems = await fetchItems!(state.items.length);
      if (newItems.isEmpty) {
        state = state.copyWith(hasReachedMax: true, isLoading: false);
      } else {
        state = state.copyWith(
          items: [...state.items, ...newItems],
          isLoading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(error: e, isLoading: false);
    }
  }

  void refresh() {
    state = PaginationState<T>();
    loadMoreItems();
  }
}