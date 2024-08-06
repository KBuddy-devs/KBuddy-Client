import 'package:json_annotation/json_annotation.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

part 'oauth_request_model.g.dart';

class OauthRequestModel {
  final String email;
  final String platform;

  OauthRequestModel({required this.email, required this.platform});
}

@JsonSerializable()
class OauthCheckModel2 {
  final String email;
  final String oauth;

  OauthCheckModel2({required this.email, required this.oauth});
  factory OauthCheckModel2.fromJson(Map<String, dynamic> json) =>
      _$OauthCheckModel2FromJson(json);
  Map<String, dynamic> toJson() => _$OauthCheckModel2ToJson(this);
}

@JsonSerializable()
class OauthLoginModel {
  final String email;
  final String oauth;

  OauthLoginModel({required this.email, required this.oauth});
  factory OauthLoginModel.fromJson(Map<String, dynamic> json) =>
      _$OauthLoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$OauthLoginModelToJson(this);
}
