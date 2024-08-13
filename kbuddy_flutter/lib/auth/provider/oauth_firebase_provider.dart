import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kbuddy_flutter/auth/model/oauth_register_model.dart';
import 'package:kbuddy_flutter/auth/model/oauth_request_model.dart';
import 'package:kbuddy_flutter/auth/model/reset_password_model.dart';
import 'package:kbuddy_flutter/auth/repository/oauth_firebase_repository.dart';
import 'package:kbuddy_flutter/common/model/base_response_model2.dart';
import 'package:kbuddy_flutter/user/provider/user_me_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/utils/logger.dart';
import '../../user/model/user_model.dart';
import '../view/oauth_regitser_screen.dart';

part 'oauth_firebase_provider.g.dart';

@riverpod
class OauthFirebase extends _$OauthFirebase {
  @override
  // Future<EmailConfirmModel> build() {
  //   return null;
  // }
  OauthRegisterModel? build() {
    return null;
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    logger.i(googleUser?.id.toString());
    logger.i(googleUser?.email.toString());
    logger.i(googleUser?.photoUrl.toString());
    logger.i(googleUser?.displayName.toString());
    logger.i(credential.toString());

    bool isOauthRegistered =
        await checkOauthState(email: googleUser!.email, platform: 'GOOGLE');

    if (isOauthRegistered) {
      await oauthLogin(email: googleUser.email, platform: 'GOOGLE');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              OauthRegitserScreen(email: googleUser.email, isGoogle: true),
        ),
      );
    }

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> register(String id, String) async {
    // final repository = ref.read(resetPasswordRepositoryProvider);
    // logger.e('emailmodel : ${emailModel.toJson().toString()}');
    // final resp =
    //     await repository.sendPasswordResetEmail(emailModel: emailModel);
    // state = resp;
    // logger.e('state : $state');
    // return state;
  }

  Future<bool> checkOauthState(
      {required String email, required String platform}) async {
    logger.i('oauth check start');
    logger.i('email: $email, platform: $platform');
    OauthCheckModel2 oauthCheckModel2 =
        OauthCheckModel2(email: email, oauth: platform);

    final repository = ref.read(oauthFirebaseRepositoryProvider);

    DefaultResponseModel2 model =
        await repository.oauthCheck(oauthCheckModel2: oauthCheckModel2);
    logger.i(model.message);
    if (model.message['status'].toString() == 'false') {
      logger.e(model.message);
      // 가입 안된 이메일임 -> 회원 가입을 위한 추가 정보 입력 화면으로 넘어감
      return false;
    } else {
      return true;
    }
  }

  Future<void> oauthLogin(
      {required String email, required String platform}) async {
    OauthLoginModel oauthLoginModel =
        OauthLoginModel(email: email, oauth: platform);
    final repository = ref.read(oauthFirebaseRepositoryProvider);
    var resp = await repository.oauthLogin(oauthLoginModel: oauthLoginModel);
    await ref.read(userMeProvider.notifier).firebaseLogin(resp);
  }

  // ...
}
