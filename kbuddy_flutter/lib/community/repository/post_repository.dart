import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/community/model/pagination_response.dart';
import 'package:retrofit/http.dart';
import '../../common/dio/dio.dart';
import '../../common/utils/logger.dart';


part 'post_repository.g.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final dio = ref.watch(dioProvider);
  logger.i('PostRepository 생성: $dio');  // 로그 추가
  return PostRepository(dio, baseUrl: 'https://mock.bnbong.xyz/kbuddy/v1');
});

@RestApi()
abstract class PostRepository {
  factory PostRepository(Dio dio, {String baseUrl}) = _PostRepository;

  @GET('/qna/')
  Future<PaginationResponse> fetchItems({
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
  });
}
