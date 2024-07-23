import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kbuddy_flutter/auth/model/oauth_register_model.dart';
import 'package:kbuddy_flutter/common/utils/logger.dart';
import 'package:kbuddy_flutter/auth/provider/oauth_register_state.dart';
import 'package:kbuddy_flutter/auth/provider/oauth_register_viewModel.dart';
import 'package:kbuddy_flutter/user/provider/user_me_provider.dart';
import '../../common/component/custom_text_form_field.dart';
import '../../common/component/text.dart';
import '../../common/const/colors.dart';
import '../../common/const/typo.dart';
import '../provider/signup_viewModel.dart';

class OauthRegitserScreen extends ConsumerStatefulWidget {
  final User user;

  const OauthRegitserScreen({
    super.key,
    required this.user,
  });

  @override
  ConsumerState<OauthRegitserScreen> createState() =>
      _OauthRegitserScreenState();
}

class _OauthRegitserScreenState extends ConsumerState<OauthRegitserScreen> {
  late TextEditingController emailController =
      TextEditingController(text: widget.user.kakaoAccount!.email);
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController nationController = TextEditingController();

  String? selectedGender;
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(oauthRegisterViewModelProvider.notifier);
    final state = ref.watch(oauthRegisterViewModelProvider);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double baseWidth = 360.0;
    double baseHeight = 640.0;

    double scaleWidth = screenWidth / baseWidth;
    double scaleHeight = screenHeight / baseHeight;

    double paddingHorizontal = 16.0 * scaleWidth;
    double paddingVertical = 16.0 * scaleHeight;
    double spacingBaseUnit10 = 10.0 * scaleHeight;

    return Scaffold(
      appBar: AppBar(
        title: Text('추가 정보 입력'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal, vertical: paddingVertical),
        child: ListView(
          children: [
            /// Email
            FlexText(content: "Email", textStyle: title300Medium),
            SizedBox(height: spacingBaseUnit10 / 2),
            CustomTextFormField(
              label: 'email',
              controller: emailController,
              readonly: true,
              onChanged: (text) {
                viewModel.updateFirstName(text);
              },
            ),
            SizedBox(height: spacingBaseUnit10),

            /// User ID
            FlexText(content: "User ID", textStyle: title300Medium),
            SizedBox(height: spacingBaseUnit10 / 2),
            CustomTextFormField(
              label: 'userId',
              controller: userIdController,
              onChanged: (text) {
                viewModel.updateLastName(text);
              },
            ),
            SizedBox(height: spacingBaseUnit10),

            /// First name
            FlexText(content: "First name", textStyle: title300Medium),
            SizedBox(height: spacingBaseUnit10 / 2),
            CustomTextFormField(
              label: 'First name',
              controller: firstNameController,
              onChanged: (text) {
                viewModel.updateFirstName(text);
              },
            ),
            SizedBox(height: spacingBaseUnit10),

            /// Last Name
            FlexText(content: "Last name", textStyle: title300Medium),
            SizedBox(height: spacingBaseUnit10 / 2),
            CustomTextFormField(
              label: 'Last name',
              controller: lastNameController,
              onChanged: (text) {
                viewModel.updateFirstName(text);
              },
            ),
            SizedBox(height: spacingBaseUnit10),

            /// Nation
            FlexText(content: "Nation", textStyle: title300Medium),
            SizedBox(height: spacingBaseUnit10 / 2),
            DropdownButtonFormField<String>(
              value: selectedCountry,
              hint: Text('Select Country'),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  viewModel.updateCountry(newValue);
                }
              },
              items: countryList.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Country',
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            SizedBox(height: spacingBaseUnit10),

            /// Gender
            FlexText(content: "Gender", textStyle: title300Medium),
            SizedBox(height: spacingBaseUnit10 / 2),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedGender = 'Male';
                      });
                      viewModel.updateGender('M');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedGender == 'Male'
                          ? Colors.white
                          : PRIMARY_COLOR,
                      backgroundColor: selectedGender == 'Male'
                          ? PRIMARY_COLOR
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: PRIMARY_COLOR),
                      ),
                    ),
                    child: Text('Male'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedGender = 'Female';
                      });
                      viewModel.updateGender('F');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedGender == 'Female'
                          ? Colors.white
                          : PRIMARY_COLOR,
                      backgroundColor: selectedGender == 'Female'
                          ? PRIMARY_COLOR
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: PRIMARY_COLOR),
                      ),
                    ),
                    child: Text('Female'),
                  ),
                ),
              ],
            ),
            SizedBox(height: spacingBaseUnit10),
            ElevatedButton(
              onPressed: () async {
                await ref.read(userMeProvider.notifier).kakaoRegister(
                    OauthRegisterModel(
                        email: widget.user.kakaoAccount!.email!,
                        oauth: "KAKAO",
                        userId: userIdController.text,
                        country: state.country,
                        firstName: firstNameController.text,
                        gender: state.gender,
                        lastName: lastNameController.text));
                // viewModel.kakaoRegister(OauthRegisterModel(
                //   email: state.email,
                //   oauth: state.oauth,
                //   userId: state.userId,
                //   country: state.country,
                //   firstName: state.firstName,
                //   gender: state.gender,
                //   lastName: state.lastName,
                // ));
              },
              child: Text("완료하기"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  //signUpState.isFormValid ? Colors.white : LIGHTGRAY_400,
                  backgroundColor: PRIMARY_COLOR,
                  //signUpState.isFormValid ? PRIMARY_COLOR : LIGHTGRAY_100,
                  minimumSize: Size(double.infinity, 50 * scaleHeight),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8)) // Disabled text color
                  ),
            )
            // child: GestureDetector(
            //     onTap: () async {
            //
            //     },
            //     child: Text("완료하기"))
          ],
        ),
      ),
    );
  }
}
