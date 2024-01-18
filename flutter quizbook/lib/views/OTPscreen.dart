// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quiz_2/Utils/Constanc.dart';
// import 'package:quiz_2/Widget/Common_Appbar.dart';
// import 'package:quiz_2/Widget/Common_Buttons.dart';
// import 'package:quiz_2/Widget/Common_TextFomrField.dart';
// import 'package:quiz_2/views/SingupScreen.dart';

// class OTPscreen extends StatelessWidget {
//   OTPscreen({super.key, required this.mobile});

//   final _key = GlobalKey<FormState>();

//   final String mobile;

//   final TextEditingController _otpcontroller = TextEditingController();

//   final TextEditingController _mobileController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     _mobileController.text = mobile;
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(50),
//           child: CommonAppBar(
//             title: "OTP Verificationn",
//             isBackArrow: true,
//           )),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 "Please Enter The 4-Digit OTP Sent To Your Phone",
//                 style: TextStyle(fontSize: 13),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: CommonTextFormField(
//                   key: _key,
//                   hint: "Enter OTP",
//                   lable: "Enter OTP Here",
//                   isMobileNumber: false,
//                   isotp: true,
//                   inputType: TextInputType.number,
//                   formatter: [otpFormater, otpLengthFormater],
//                   errorMessage: "Please Enter Firts OTP",
//                   controller: _otpcontroller),
//             ),

// //Now, an error message will be displayed if the OTP field is empty when attempting to navigate to the next screen.
//             // commonbutton(
//             //   OnPress: () async {
//             //     if (_key.currentState!.validate()) {
//             //       if (_otpcontroller.text.isEmpty) {
//             //         // Display error message when OTP field is empty
//             //         Get.snackbar("Error", "Please enter OTP");
//             //       } else {
//             //         // Navigate to the next screen only if OTP field is not empty
//             //         Get.to(
//             //           transition: Transition.leftToRightWithFade,
//             //           duration: Duration(seconds: 1),
//             //           () => SingupScreen(
//             //             mobileNumber: mobile,
//             //           ),
//             //         );
//             //       }
//             //     }
//             //   },
//             //   title: 'Sign Up',
//             // ),

//             commonbutton(
//                 OnPress: () async {
//                   if (_key.currentState!.validate()) {
//                     Get.to(
//                         transition: Transition.leftToRightWithFade,
//                         duration: Duration(seconds: 1),
//                         () => SingupScreen(
//                               mobileNumber: mobile,
//                             ));
//                   }
//                 },
//                 title: 'Sing Up'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:quiz_2/Utils/Constanc.dart';
// import 'package:quiz_2/Widget/Common_Appbar.dart';
// import 'package:quiz_2/Widget/Common_Buttons.dart';
// import 'package:quiz_2/Widget/Common_TextFomrField.dart';
// import 'package:quiz_2/views/SingupScreen.dart';

// class OTPscreen extends StatefulWidget {
//   @override
//   _OTPscreenState createState() => _OTPscreenState();
// }

// class _OTPscreenState extends State<OTPscreen> {
//   final GlobalKey<FormState> _Key = GlobalKey<FormState>();

//   TextEditingController mobileNumberController = TextEditingController();
//   TextEditingController otpController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(50),
//           child: CommonAppBar(
//             title: "OTP Verification",
//             isBackArrow: true,
//           )),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _Key,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.30,
//               ),
//               Text(
//                 "Please Enter The 4-Digit OTP Sent To Your Phone.",
//                 style: TextStyle(
//                   fontSize: 13,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 60, right: 60, top: 30),
//                 child: CommonTextFormField(
//                     hint: "Enter OTP Here",
//                     lable: "Enter OTP",
//                     inputType: TextInputType.number,
//                     formatter: [otpFormater, otpLengthFormater],
//                     errorMessage: "Enter OTP First",
//                     controller: otpController),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 30,
//               ),
//               commonbutton(
//                   OnPress: () async {
//                     if (_Key.currentState!.validate()) {
//                       final data = otpController.text;
//                       Get.to(
//                           transition: Transition.leftToRightWithFade,
//                           duration: Duration(seconds: 1),
//                           () => SingupScreen(
//                                 mobileNumber: '',
//                               ));
//                     }
//                   },
//                   title: 'Sing Up'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_2/Utils/Constanc.dart';
import 'package:quiz_2/Widget/Common_Buttons.dart';
import 'package:quiz_2/Widget/Common_TextFomrField.dart';
import 'package:quiz_2/views/SingupScreen.dart';

class OTPscreen extends StatelessWidget {
  OTPscreen({super.key, required this.mobile});

  final String mobile;

  final GlobalKey<FormState> _Key = GlobalKey<FormState>();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mobileNumberController.text = mobile;
    print('mobile ====${mobile}');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "OTP Verification",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              if (value == 'settings') {
                // Do something when 'Settings' is selected
              } else if (value == 'logout') {
                // Do something when 'Logout' is selected
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'settings',
                  child: Text('Settings'),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _Key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Please Enter The 4-Digit OTP Sent To Your Phone.",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60, top: 30),
                child: CommonTextFormField(
                    hint: "Enter OTP Here",
                    lable: "Enter OTP",
                    isotp: true,
                    inputType: TextInputType.number,
                    formatter: [otpFormater, otpLengthFormater],
                    errorMessage: "Enter OTP First",
                    controller: otpController),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              commonbutton(
                OnPress: () async {
                  if (_Key.currentState!.validate()) {
                    // final data = otpController.text;
                    print('mobile number =======> ${mobile}');

                    Get.to(
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(seconds: 1),
                      () => SingupScreen(
                        mobileNumber: mobile,
                      ),
                    );
                  }
                },
                title: 'Sing Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
