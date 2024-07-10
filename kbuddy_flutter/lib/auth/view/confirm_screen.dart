import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/common/component/custom_text_form_field.dart';
import 'package:kbuddy_flutter/common/component/text.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';

import '../provider/signup_viewModel.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConfirmScreen(),
    );
  }
}

class ConfirmScreen extends ConsumerStatefulWidget {
  const ConfirmScreen({super.key});

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends ConsumerState<ConfirmScreen> {

  final TextEditingController codeEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpProvider);
    final signUpViewModel = ref.watch(signUpProvider.notifier);

    double baseWidth = 360.0;
    double baseHeight = 640.0;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double scaleWidth = screenWidth / baseWidth;
    double scaleHeight = screenHeight / baseHeight;

    double paddingHorizontal = 16.0 * scaleWidth;
    double paddingVertical = 16.0 * scaleHeight;
    double spacingXxLarge = 144.0 * 1.8 * scaleHeight;
    double spacingBaseUnit10 = 10.0 * scaleHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement back button functionality
          },
        ),
        title: FlexText(
          content: 'Create account',
          textStyle: title100Light,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: 2.0,
            color: LIGHTGRAY_300,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(paddingHorizontal),
        child: ListView(
          children: [
            SizedBox(height: paddingVertical),
            FlexText(
              content: 'Enter the confirmation code',
              textStyle: title100Medium,
            ),
            SizedBox(height: paddingVertical),
            FlexText(
              content:
                  'Confirmation sent. To continue, check your email & enter the 6-digit code we sent to xxx@gmail.com',
              textStyle: body100Light,
            ),
            SizedBox(height: paddingVertical),
            FlexText(
              content: "Confirmation code",
              textStyle: title300Medium,
            ),
            SizedBox(
              height: 6,
            ),
            //수정 예정
            CustomTextFormField(
              label: 'Enter the code',
              controller: codeEditingController,
              onChanged: (code){
                signUpViewModel.updateCode(code);
              },
            ),
            SizedBox(height: spacingXxLarge),
            ElevatedButton(
              onPressed: () {
                // Implement sign up button functionality
              },
              child: Text(
                'Next',
                style: TextStyle(fontSize: 16.0 * scaleHeight),
              ),
              style: ElevatedButton.styleFrom(
                  foregroundColor:
                  signUpState.isCodeBoxValid ? Colors.white : LIGHTGRAY_400,
                  backgroundColor: signUpState.isCodeBoxValid
                      ? PRIMARY_COLOR
                      : LIGHTGRAY_100,
                  minimumSize: Size(double.infinity, 50 * scaleHeight),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(8)) // Disabled text color
              ),
            ),
            //SizedBox(height: 16.0),
            Center(
              child: TextButton(
                onPressed: () {
                  // Implement 'I didn't get the code' functionality
                },
                child: Text(
                  "I didn't get the code",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
