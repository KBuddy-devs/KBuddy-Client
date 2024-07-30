import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/common/const/data.dart';
import 'package:kbuddy_flutter/common/dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../common/model/base_response_model.dart';
import '../model/postbox_model.dart';

part 'postbox_repository.g.dart';

final postBoxRepositoryProvider = Provider<PostBoxRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return PostBoxRepository(dio, baseUrl: baseUrl);
});

@RestApi()
abstract class PostBoxRepository {
  factory PostBoxRepository(Dio dio, {String baseUrl}) = _PostBoxRepository;

  @GET('/postbox')
  Future<DefaultResponseModel<List<PostBox>>> fetchPostBox({
    @Query('cursor') String? cursor,
    @Query('limit') required int limit,
  });
}
