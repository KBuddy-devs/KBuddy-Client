import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/common/model/code_response_model.dart';
import 'package:retrofit/http.dart';

import '../../common/const/data.dart';
import '../../common/dio/dio.dart';
import '../../common/model/base_response_model.dart';

part 'email_repository.g.dart';

final emailRepositoryProvider = Provider<EmailRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return EmailRepository(dio, baseUrl: baseUrl);
});

@RestApi()
abstract class EmailRepository {
  factory EmailRepository(Dio dio, {String baseUrl}) = _EmailRepository;

  @POST('/user/auth/email/check')
  Future<DefaultResponseModel<bool>> checkEmailExists({
    @Body() required Map<String, dynamic> email,
  });

  @POST('/user/auth/email/send')
  Future<CodeResponseModel> sendVerificationCode({
    @Body() required Map<String, dynamic> email,
  });
}

// class EmailRepository {
//   final Dio _dio = Dio();
//
//   Future<bool> checkEmailExists(String email) async {
//     final response = await _dio.post(
//       'https://api.bnbong.xyz/api/v1/user/auth/email/check',
//       data: {'email': email},
//       options: Options(
//         headers: {'Content-Type': 'application/json; charset=UTF-8'},
//       ),
//     );
//
//     if (response.statusCode == 200) {
//       print('success to check email');
//       return response.data['status'] == 'false';
//     } else {
//       throw Exception('Failed to check email');
//     }
//   }
//
//   Future<String> sendVerificationCode(String email) async {
//     final response = await _dio.post(
//       'https://api.bnbong.xyz/api/v1/user/auth/email/send',
//       data: {'email': email},
//       options: Options(
//         headers: {'Content-Type': 'application/json; charset=UTF-8'},
//       ),
//     );
//
//     if (response.statusCode == 200) {
//       final data = response.data['message'];
//       print('$data');
//       return response.data['message'];
//     } else {
//       throw Exception('Failed to send verification code');
//     }
//   }
// }
