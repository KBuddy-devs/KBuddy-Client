class AuthResponse {
  final String refreshToken;
  final String accessToken;
  final int accessTokenExpiredTime;
  final int refreshTokenExpiredTime;

  AuthResponse({
    required this.refreshToken,
    required this.accessToken,
    required this.accessTokenExpiredTime,
    required this.refreshTokenExpiredTime,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
      accessTokenExpiredTime: json['accessTokenExpireTime'],
      refreshTokenExpiredTime: json['refreshTokenExpireTime'],
    );
  }
}
