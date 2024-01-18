import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String bgimage = "assets/image/bg.png";
const String Logo = "assets/image/Logo.png";
const String Quizbook = "assets/image/quiz_book.png";

const Color WhiteColor = Colors.white;
const Color BlackColor = Colors.black;
const Color MixPurple = Color.fromARGB(255, 103, 14, 226);
const Color MixBlack = Color.fromARGB(255, 109, 101, 101);
const Color RedColor = Colors.red;
const Color GreenColor = Colors.green;
const Color mixred = Colors.redAccent;
const Color mixgreen = Colors.greenAccent;
const Color GreyColor = Colors.grey;

final mobileNumberFormater = FilteringTextInputFormatter.allow(RegExp('[0-9]'));

final LengthLimitingTextInputFormatter mobileLengthFormater =
    LengthLimitingTextInputFormatter(10);

final otpFormater = FilteringTextInputFormatter.allow(RegExp('[0-9]'));

final LengthLimitingTextInputFormatter otpLengthFormater =
    LengthLimitingTextInputFormatter(4);
