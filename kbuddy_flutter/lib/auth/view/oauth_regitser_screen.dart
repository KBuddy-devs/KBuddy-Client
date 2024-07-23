import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kbuddy_flutter/auth/model/oauth_register_model.dart';
import 'package:kbuddy_flutter/common/utils/logger.dart';
import 'package:kbuddy_flutter/user/provider/user_me_provider.dart';

class OauthRegitserScreen extends ConsumerStatefulWidget {
  final User user;

  const OauthRegitserScreen({super.key, required this.user});

  @override
  ConsumerState<OauthRegitserScreen> createState() =>
      _OauthRegitserScreenState();
}

class _OauthRegitserScreenState extends ConsumerState<OauthRegitserScreen> {
  @override
  Widget build(BuildContext context) {
    // 추가 정보 수집 페이지 UI를 여기에 작성하세요
    final state = ref.watch(userMeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('추가 정보 입력'),
      ),
      body: Center(
          child: GestureDetector(
              onTap: () async {
                logger.i("oauth 회원가입 시도");
                await ref.read(userMeProvider.notifier).kakaoRegister(
                    OauthRegisterModel(
                        email: "email",
                        oauth: "KAKAO",
                        userId: "userId",
                        country: "KOREA",
                        firstName: "firstName",
                        gender: 'M',
                        lastName: "lastName"));
              },
              child: Text("완료하기"))),
    );
  }
}
