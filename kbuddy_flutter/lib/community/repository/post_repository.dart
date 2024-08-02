import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/community/repository/pagination_response.dart';
import 'package:retrofit/http.dart';
import '../../common/dio/dio.dart';


part 'post_repository.g.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return PostRepository(dio, baseUrl: 'https://api.bnbong.xyz/coursemate/v1');
});

@RestApi()
abstract class PostRepository {
  factory PostRepository(Dio dio, {String baseUrl}) = _PostRepository;

  @GET('/qna/list')
  Future<PaginationResponse> fetchItems({
    @Query('page') int? page,
  });
}
