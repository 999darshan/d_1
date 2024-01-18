import 'package:flutter/material.dart';
import 'package:quiz_2/Utils/Constanc.dart';

class commonbutton extends StatelessWidget {
  final VoidCallback OnPress;
  final String title;

  final TextStyle buttonTextStyle = TextStyle(
      color: WhiteColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2);
  commonbutton({
    super.key,
    required this.OnPress,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: MixPurple,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(00),
                side: BorderSide(
                  color: WhiteColor,
                ))),
        onPressed: OnPress,
        child: Text(
          title,
          style: buttonTextStyle,
        ));
  }
}
