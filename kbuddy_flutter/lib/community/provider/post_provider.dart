import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/community/provider/pagination_state.dart';

import '../repository/post_repository.dart';

final postProvider =
    StateNotifierProvider<PostNotifier, PaginationState>((ref) {
  final repository = ref.watch(postRepositoryProvider);

  return PostNotifier(repository);
});

class PostNotifier extends StateNotifier<PaginationState> {
  final PostRepository? _repository;
  int _currentPage = 1;
  PostNotifier(this._repository) : super(const PaginationState.initial());
  Future<void> fetchItems() async {
    if(state is Loading) return;
    try{
      state = const PaginationState.loading();
      if (_repository != null) {
        final response = await _repository!.fetchItems(page: _currentPage);
        _currentPage++;
        state = PaginationState.data(response.result, response.next == null);
      } else {
        state = const PaginationState.error("Repository is null");
      }
    }catch(e){
      state = PaginationState.error(e.toString());
    }
  }
}
