import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/community/provider/pagination_state.dart';

import '../../common/utils/logger.dart';
import '../model/post_model.dart';
import '../repository/post_repository.dart';

final postProvider =
    StateNotifierProvider<PostNotifier, PaginationState>((ref) {
  final repository = ref.watch(postRepositoryProvider);

  return PostNotifier(repository);
});

class PostNotifier extends StateNotifier<PaginationState> {
  final PostRepository? _repository;
  int _currentPage = 1;
  final int _pageSize = 10;
  List<PostModel> _cachedItems = [];
  bool _hasReachedMax = false;

  PostNotifier(this._repository) : super(const PaginationState.initial()){
    fetchItems();
  }

  Future<void> fetchItems({bool refresh = false}) async {
    logger.i('post_provider: fetchItems 실행');
    if(state is Loading && !refresh) return;
    if(_hasReachedMax && !refresh) return;

    try{
      // if (!refresh && _cachedItems.isNotEmpty) {
      //   state = PaginationState.data(_cachedItems, false);
      // } else {
      //   state = const PaginationState.loading();
      // }
      if(!refresh && _cachedItems.isNotEmpty){
        state = PaginationState.loading();
      }
      logger.i('post_provider: -> loading()');
      if (_repository != null) {
        final response = await _repository!.fetchItems(page: _currentPage, pageSize: _pageSize);
        logger.i('post_provider: -> data()'
            'data: $response');
        List<PostModel> newItems = response.message.results;
        if (refresh) {
          _cachedItems = newItems;
          _currentPage = 2;
        } else {
          _cachedItems.addAll(newItems);
          _currentPage++;
        }
        _hasReachedMax = response.message.next == null;

        state = PaginationState.data(_cachedItems, _hasReachedMax);
      } else {
        state = const PaginationState.error("Repository is null");
      }
    }catch(e){
      state = PaginationState.error(e.toString());
    }
  }
  void refreshItems(){
    fetchItems(refresh: true);
  }
  List<PostModel> get cachedItems => _cachedItems;
}

// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// // 상태 관리용 provider 정의
// final postProvider = StateNotifierProvider<PostNotifier, PostState>((ref) {
//   return PostNotifier();
// });
//
// // 상태 관리용 StateNotifier 클래스 정의
// class PostNotifier extends StateNotifier<PostState> {
//   PostNotifier() : super(PostState.initial()) {
//     fetchItems(); // 초기화 시 데이터를 로드합니다.
//   }
//   int _page = 0;
//
//   Future<void> fetchItems() async {
//     if (state.status == PostStatus.loading) return;
//
//     state = PostState.loading(state.items);
//     await Future.delayed(Duration(seconds: 2)); // Simulate network delay
//
//     final newItems = List.generate(20, (index) => Item(title: 'Item ${index + 1 + 10*(_page)}'));
//     final allItems = [...state.items, ...newItems];
//
//     _page++;
//     final isEnd = allItems.length >= 100;
//
//     state = PostState.data(allItems, isEnd);
//   }
// }
//
// // 상태를 표현하는 클래스 정의
// class PostState {
//   final List<Item> items;
//   final bool isEnd;
//   final PostStatus status;
//   final String? errorMessage;
//
//   const PostState._(this.status, {this.items = const [], this.isEnd = false, this.errorMessage});
//
//   const PostState.initial() : this._(PostStatus.initial);
//   const PostState.loading(List<Item> items) : this._(PostStatus.loading, items: items);
//   const PostState.data(List<Item> items, bool isEnd)
//       : this._(PostStatus.data, items: items, isEnd: isEnd);
//   const PostState.error(String message) : this._(PostStatus.error, errorMessage: message);
//
//   T when<T>({
//     required T Function() initial,
//     required T Function() loading,
//     required T Function(List<Item> items, bool isEnd) data,
//     required T Function(String message) error,
//   }) {
//     switch (status) {
//       case PostStatus.initial:
//         return initial();
//       case PostStatus.loading:
//         return loading();
//       case PostStatus.data:
//         return data(items, isEnd);
//       case PostStatus.error:
//         return error(errorMessage!);
//     }
//   }
// }
//
// // 상태를 나타내는 enum 정의
// enum PostStatus { initial, loading, data, error }
//
// // 리스트 항목을 표현하는 클래스 정의
// class Item {
//   final String title;
//
//   Item({required this.title});
// }
