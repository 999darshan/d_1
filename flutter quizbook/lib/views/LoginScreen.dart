import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_2/Utils/Constanc.dart';
import 'package:quiz_2/Widget/Common_Buttons.dart';
import 'package:quiz_2/Widget/Common_TextFomrField.dart';
import 'package:quiz_2/views/OTPscreen.dart';

class LoginScreen extends StatelessWidget {
  final _key = GlobalKey<FormState>();

  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //bg image scrolling but image not fixed
            //           SingleChildScrollView(
            //   child: Center(
            //     child: Image.asset(
            //       bgimage,
            //       fit: BoxFit.fill,
            //       width: MediaQuery.of(context).size.width / 1,
            //     ),
            //   ),
            // ),
            Center(
              child: Image.asset(
                bgimage,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 1,
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 160),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height / 11,
                          child: Image.asset(logoo)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                          child: Image.asset(QuizBook)),
                    ),
                    Form(
                        key: _key,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 90, right: 20, left: 20),
                          child: CommonTextFormField(
                            controller: _mobileController,
                            hint: "Add Mobile Number",
                            lable: "Mobile",
                            inputType: TextInputType.number,
                            isMobileNumber: true,
                            textInputAction: false,
                            formatter: [
                              mobileNumberFormater,
                              mobileLengthFormater,
                            ],
                            errorMessage: "Enter Your Mobile Number",
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height / 18,
        child: commonbutton(
            OnPress: () async {
              if (_key.currentState!.validate()) {
                final data = _mobileController.text;
                Get.to(
                    transition: Transition.leftToRightWithFade,
                    duration: Duration(seconds: 1),
                    () => OTPscreen(mobile: data));
              }
            },
            title: 'Send OTP'),
      ),
    );
  }
}
