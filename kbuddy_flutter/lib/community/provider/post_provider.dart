import 'package:kbuddy_flutter/community/provider/pagination_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/post_model.dart';

part 'post_provider.g.dart';

@riverpod
PaginationNotifier<Post> postPagination(PostPaginationRef ref) {
  return PaginationNotifier<Post>(
    fetchItems: (offset) async {
      // API 호출 로직
      // 예: return apiService.fetchPosts(offset: offset, limit: 20);
    },
  );
}