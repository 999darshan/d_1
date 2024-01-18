import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_2/Utils/Constanc.dart';
import 'package:quiz_2/Utils/Utilities.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String lable;
  final bool textInputAction;
  final TextInputType inputType;
  final List<TextInputFormatter> formatter;
  final String errorMessage;
  final bool isMobileNumber;
  final bool isotp;
  final bool isEmailField;
  final bool isReadOnly;

  CommonTextFormField({
    super.key,
    required this.hint,
    required this.lable,
    this.textInputAction = true,
    required this.inputType,
    required this.formatter,
    this.isMobileNumber = false,
    required this.errorMessage,
    required this.controller,
    this.isotp = false,
    this.isEmailField = false,
    this.isReadOnly = false,
  });

  final TextStyle lableStyle =
      TextStyle(color: BlackColor, fontSize: 15, fontWeight: FontWeight.w500);
  final TextStyle hintStyle = TextStyle(color: MixBlack, fontSize: 13);
  final TextStyle textStyle = TextStyle(color: BlackColor, fontSize: 15);
  final TextStyle mobileNumberStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        readOnly: isReadOnly,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: TextInputAction.go,
        keyboardType: inputType,
        style: textStyle,
        inputFormatters: formatter,
        decoration: InputDecoration(
            prefix: isMobileNumber
                ? Text('+91 ', style: mobileNumberStyle)
                : SizedBox.shrink(),
            hintText: hint,
            hintStyle: hintStyle,

            // focusedBorder: border,
            label: Text(
              lable,
              style: lableStyle,
            )),
        validator: (newVal) {
          if (isMobileNumber) {
            if (newVal!.isEmpty || newVal!.length < 10) {
              return errorMessage;
            }
          }
          if (isotp) {
            if (newVal!.isEmpty || newVal!.length < 4) {
              return errorMessage;
            }
          } else if (isEmailField) {
            if (newVal!.isEmpty || !emailcode.isEmailValid(newVal)) {
              return errorMessage;
            } else {
              print('email is valid');
            }
          }
          // im trying with isotp but actully newVal keyword using in this condition
          // if (isotp == null || isotp.isEmpty) {
          //       return 'Please enter the OTP';
          //     }

          // if (newVal == null || newVal.isEmpty) {
          //   return 'Please enter the OTP';
          // }
          else {
            if (newVal!.isEmpty) {
              return errorMessage;
            }
          }
          return null;
        });
  }
}
