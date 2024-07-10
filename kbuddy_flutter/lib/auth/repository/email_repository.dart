import 'package:dio/dio.dart';

class EmailRepository {
  final Dio _dio = Dio();

  Future<bool> checkEmailExists(String email) async {
    final response = await _dio.post(
      'https://api.bnbong.xyz/api/v1/user/auth/email/check',
      data: {'email': email},
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      ),
    );

    if (response.statusCode == 200) {
      print('success to check email');
      return response.data['status'] == 'false';
    } else {
      throw Exception('Failed to check email');
    }
  }

  Future<String> sendVerificationCode(String email) async {
    final response = await _dio.post(
      'https://api.bnbong.xyz/api/v1/user/auth/email/send',
      data: {'email': email},
      options: Options(
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data['message'];
      print('$data');
      return response.data['message'];
    } else {
      throw Exception('Failed to send verification code');
    }
  }
}
