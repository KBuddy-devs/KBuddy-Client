import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kbuddy_flutter/common/alert/provider/alert_snackbar_provider.dart';
import 'package:kbuddy_flutter/common/alert/view/alert_snackbar.dart';
import 'package:kbuddy_flutter/common/component/regex.dart';
import 'package:kbuddy_flutter/common/component/text.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';

import '../../common/component/custom_text_form_field.dart';
import '../provider/signup_viewModel.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();
  final TextEditingController createController = TextEditingController();
  final TextEditingController nationController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmFocusNode = FocusNode();
  final FocusNode idFocusNode = FocusNode();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode createFocusNode = FocusNode();
  final FocusNode nationFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();

  bool isPasswordFocused = false;
  bool isConfirmPasswordFocused = false;
  bool isFirstNameFocused = false;
  bool isLastNameFocused = false;
  bool isUserIdFocused = false;
  bool isCreateFocused = false;
  bool isNationFocused = false;
  bool isEmailFocused = false;

  String? selectedGender;

  @override
  void initState() {
    super.initState();
    passwordFocusNode.addListener(() {
      setState(() {
        isPasswordFocused = passwordFocusNode.hasFocus;
      });
    });
    confirmFocusNode.addListener(() {
      setState(() {
        isConfirmPasswordFocused = confirmFocusNode.hasFocus;
      });
    });
    idFocusNode.addListener(() {
      setState(() {
        isUserIdFocused = idFocusNode.hasFocus;
      });
    });
    lastNameFocusNode.addListener(() {
      setState(() {
        isLastNameFocused = lastNameFocusNode.hasFocus;
      });
    });
    firstNameFocusNode.addListener(() {
      setState(() {
        isFirstNameFocused = firstNameFocusNode.hasFocus;
      });
    });
    emailFocusNode.addListener(() {
      setState(() {
        isEmailFocused = emailFocusNode.hasFocus;
      });
    });
    createFocusNode.addListener(() {
      setState(() {
        isCreateFocused = createFocusNode.hasFocus;
      });
    });
    nationFocusNode.addListener(() {
      setState(() {
        isNationFocused = nationFocusNode.hasFocus;
      });
    });
    final signUpState = ref.read(signUpProvider);
    if (signUpState.email != null) {
      emailController.text = signUpState.email!;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    userIdController.dispose();
    passwordController.dispose();
    passwordCheckController.dispose();
    createController.dispose();
    nationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpProvider);
    final signUpViewModel = ref.watch(signUpProvider.notifier);
    //final signUpNotifier = ref.read(signUpProvider.notifier);

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement back button functionality
          },
        ),
        title: Text(
          'Create account',
          style: TextStyle(fontSize: 20.0 * scaleHeight),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal, vertical: paddingVertical),
        child: ListView(
          children: [
            /// First name
            FlexText(content: "First name", textStyle: title300Medium),
            SizedBox(height: spacingBaseUnit10 / 2),
            CustomTextFormField(
              label: 'First name',
              controller: firstNameController,
              focusNode: firstNameFocusNode,
              onChanged: (text) {
                signUpViewModel.updateFirstName(text);
              },
            ),
            if (isFirstNameFocused)
              ValidationWidget(
                text: firstNameController.text,
                validationType: ValidationType.fName,
              ),
            SizedBox(height: spacingBaseUnit10),

            /// Last name
            FlexText(content: "Last name", textStyle: title300Medium),
            SizedBox(height: spacingBaseUnit10 / 2),
            CustomTextFormField(
              label: 'Last name',
              controller: lastNameController,
              focusNode: lastNameFocusNode,
              onChanged: (text) {
                signUpViewModel.updateLastName(text);
              },
            ),
            if (isLastNameFocused)
              ValidationWidget(
                text: lastNameController.text,
                validationType: ValidationType.lName,
              ),
            SizedBox(height: spacingBaseUnit10),

            /// Nation
            FlexText(content: "Nation", textStyle: title300Medium),
            SizedBox(height: spacingBaseUnit10 / 2),
            DropdownButtonFormField<String>(
              value: signUpState.selectedCountry,
              hint: Text('Select Country'),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  signUpViewModel.selectCountry(newValue);
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
              focusNode: nationFocusNode,
            ),
            SizedBox(height: spacingBaseUnit10),

            /// Email address
            FlexText(content: "Email address", textStyle: title300Medium),
            SizedBox(height: spacingBaseUnit10 / 2),
            CustomTextFormField(
              label: 'Email address',
              controller: emailController,
              onChanged: (text) {
                signUpViewModel.updateEmail(text);
              },
              canChange: true,
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
                      signUpViewModel.updateSex('M');
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
                      signUpViewModel.updateSex('F');
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

            /// User ID
            FlexText(content: "User ID", textStyle: title300Medium),
            CustomTextFormField(
              label: 'User ID',
              controller: userIdController,
              focusNode: idFocusNode,
              onChanged: (text) {
                signUpViewModel.updateUsername(text);
              },
            ),
            if (isUserIdFocused)
              ValidationWidget(
                text: userIdController.text,
                validationType: ValidationType.id,
              ),
            SizedBox(height: spacingBaseUnit10),

            /// Password
            FlexText(content: "Password", textStyle: title300Medium),
            CustomTextFormField(
                label: 'Password',
                controller: passwordController,
                isPassword: true,
                focusNode: passwordFocusNode,
                onChanged: (text) {
                  signUpViewModel.updatePassword(text);
                }),
            if (isPasswordFocused)
              ValidationWidget(
                text: passwordController.text,
                confirmPassword: passwordCheckController.text,
                validationType: ValidationType.pwd,
              ),
            SizedBox(height: spacingBaseUnit10),

            /// Confirm Password
            FlexText(content: "Confirm password", textStyle: title300Medium),
            CustomTextFormField(
              label: 'Confirm password',
              controller: passwordCheckController,
              isPassword: true,
              focusNode: confirmFocusNode,
              onChanged: (text) {
                signUpViewModel.updateConfirmPassword(text);
              },
            ),
            if (isConfirmPasswordFocused)
              ValidationWidget(
                  text: passwordController.text,
                  confirmPassword: passwordCheckController.text,
                  validationType: ValidationType.pwdMatch),
            SizedBox(height: spacingBaseUnit10 * 2),
            ElevatedButton(
              onPressed: signUpState.isFormValid
                  ? () {
                      signUpViewModel.signUp();
                      AlertSnackbarProvider.showAlertSnackbar(
                          context: context,
                          message: "Registration is Complete",
                          status: AlertSnackbarEnum.success,
                          position: AlertSnackbarPositionEnum.bottom,
                          duration: 3);
                      context.go('/login');
                    }
                  : null,
              child: Text(
                'Sign up',
                style: TextStyle(fontSize: 16.0 * scaleHeight),
              ),
              style: ElevatedButton.styleFrom(
                  foregroundColor:
                      signUpState.isFormValid ? Colors.white : LIGHTGRAY_400,
                  backgroundColor:
                      signUpState.isFormValid ? PRIMARY_COLOR : LIGHTGRAY_100,
                  minimumSize: Size(double.infinity, 50 * scaleHeight),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8)) // Disabled text color
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
