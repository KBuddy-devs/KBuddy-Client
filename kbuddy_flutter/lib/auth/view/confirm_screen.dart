

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360.0;
    double baseHeight = 640.0;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double scaleWidth = screenWidth / baseWidth;
    double scaleHeight = screenHeight / baseHeight;

    double paddingHorizontal = 16.0 * scaleWidth;
    double paddingVertical = 16.0 * scaleHeight;
    double spacingXxLarge = 144.0 *2* scaleHeight;
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
        title: Text('Create account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(paddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: paddingVertical),
            Text(
              'Enter the confirmation code',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: paddingVertical),
            Text(
              'Confirmation sent. To continue, check your email & enter the 6-digit code we sent to xxx@gmail.com',
            ),
            SizedBox(height: paddingVertical),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirmation code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: spacingXxLarge),
            ElevatedButton(
              onPressed: () {
                // Implement next button functionality
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.grey, backgroundColor: Colors.grey[200], minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                )// Disabled text color
              ),
            ),
            SizedBox(height: 16.0),
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