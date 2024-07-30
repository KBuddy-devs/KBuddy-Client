import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/community/model/postbox_model.dart';
import 'package:kbuddy_flutter/community/repository/postbox_repository.dart';

final postBoxProvider =
    StateNotifierProvider<PostBoxNotifier, AsyncValue<List<PostBox>>>((ref) {
  final repository = ref.watch(postBoxRepositoryProvider);
  return PostBoxNotifier(repository);
});

class PostBoxNotifier extends StateNotifier<AsyncValue<List<PostBox>>>{
  final PostBoxRepository _repository;
  String? _nextCursor;
  static const int _limit = 20;
  bool _hasMore = true;

  PostBoxNotifier(this._repository) : super(const AsyncValue.loading()){{
    loadMore();
  }}

 Future<void> loadMore() async {
    if(!_hasMore) return;

    try{
      final response = await _repository.fetchPostBox(cursor: _nextCursor, limit: _limit);
      final newPostBoxes = response.data as List<PostBox>? ?? [];
      if(newPostBoxes.isEmpty){
        _hasMore = false;
      } else{
        _nextCursor = newPostBoxes.last.id;
        final currentPostBoxes = state.value ?? [];
        state = AsyncValue.data([...currentPostBoxes, ...newPostBoxes]);
      }
    } catch(e,stackTrace){
      state = AsyncValue.error(e,stackTrace);
    }
 }
 void refresh(){
    _nextCursor = null;
    _hasMore = true;
    state = const AsyncValue.loading();
    loadMore();
 }
}