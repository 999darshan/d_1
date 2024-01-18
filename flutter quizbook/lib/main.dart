import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_2/views/Bottom_Screen.dart';
import 'package:quiz_2/views/LoginScreen.dart';
import 'package:quiz_2/views/OTPscreen.dart';
import 'package:quiz_2/views/SingupScreen.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QUIZ APP AGAIN",
      home: Bottom_Screen(
          // mobileNumber: '',
          ),
    );
  }
}
