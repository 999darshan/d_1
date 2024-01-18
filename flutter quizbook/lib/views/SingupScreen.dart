import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_2/Controller/Image_Controller.dart';
import 'package:quiz_2/Controller/Singup_Controller.drt.dart';
import 'package:quiz_2/Utils/Constanc.dart';
import 'package:quiz_2/Widget/Common_Appbar.dart';
import 'package:quiz_2/Widget/Common_Buttons.dart';
import 'package:quiz_2/Widget/Common_Dropdown.dart';
import 'package:quiz_2/Widget/Common_TextFomrField.dart';
import 'package:quiz_2/views/Bottom_Screen.dart';
import 'package:quiz_2/views/LoginScreen.dart';

class SingupScreen extends StatelessWidget {
  SingupScreen({
    super.key,
    required this.mobileNumber,
  });
  final _key = GlobalKey<FormState>();

  final String mobileNumber;

  final TextEditingController _firstname = TextEditingController();

  final TextEditingController mobileNumberController = TextEditingController();

  final TextEditingController _lastnamecontroller = TextEditingController();

  final TextEditingController _emailcontroller = TextEditingController();

  final SignUpController _controller = Get.put(SignUpController());

  final TextEditingController _dobController = TextEditingController();

  final Photocontroller PhotoController = Get.put(Photocontroller());

  void _onClick() async {
    ImagePickerService().pickCropImage(
        CropAspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        ImageSource: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    mobileNumberController.text = mobileNumber;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CommonAppBar(
            title: "Update Profile",
            isBackArrow: true,
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              GestureDetector(
                onTap: PhotoController.pickImage,
                child: Obx(() {
                  return (PhotoController.selectedImage.value == null)
                      ? CircleAvatar(
                          radius: 50,
                          backgroundColor: GreyColor,
                          child: Image.asset(AddPic),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              FileImage(PhotoController.selectedImage.value!),
                        );
                }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: CommonTextFormField(
                  controller: _firstname,
                  hint: "Enter Your Name",
                  lable: "First Name",
                  inputType: TextInputType.name,
                  textInputAction: false,
                  formatter: [],
                  errorMessage: "Enter Your Name",
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: CommonTextFormField(
                  controller: _lastnamecontroller,
                  hint: "Enter Your Surname",
                  lable: "Last Name",
                  inputType: TextInputType.name,
                  textInputAction: false,
                  formatter: [],
                  errorMessage: "Enter Your Surname Here",
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: CommonTextFormField(
                  controller: _emailcontroller,
                  hint: "Enter Your Email",
                  lable: "Email Id",
                  isEmailField: true,
                  inputType: TextInputType.name,
                  textInputAction: false,
                  formatter: [],
                  errorMessage: "Enter Your Email Here",
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: CommonTextFormField(
                  controller: mobileNumberController,
                  hint: "Add Mobile Number",
                  lable: "Mobile",
                  inputType: TextInputType.number,
                  isMobileNumber: true,
                  textInputAction: false,
                  isReadOnly: true,
                  formatter: [
                    mobileNumberFormater,
                    mobileLengthFormater,
                  ],
                  errorMessage: "Enter Your Mobile Number",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width / 2 - 10),
                      child: Flexible(
                        child: Obx(
                          () => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: CommonDropdown(
                              value: _controller.selectedGender.value,
                              items: ['Male', 'Female', 'Other'],
                              labelText: 'Gender',
                              hintText: 'Select gender',
                              onChanged: (value) {
                                _controller.selectedGender(value);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please select a gender";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    // Wrap the Date Picker with Expanded
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 18),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: TextFormField(
                          controller: _dobController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              // Format the pickedDate as needed
                              String formattedDate =
                                  "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                              _dobController.text = formattedDate;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: BlackColor),
                            hintText: 'Select date',
                            hintStyle:
                                TextStyle(fontSize: 12, color: BlackColor),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please select birthdate";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // ... (existing code)

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ... (existing code for gender dropdown)

                  // Designation Dropdown
                  Center(
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width * 0.95),
                      child: Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Obx(
                            () => CommonDropdown(
                              value: _controller.selectedDesignation.value,
                              items: [
                                'Developer',
                                'Designer',
                                'Manager',
                                'Other'
                              ],
                              labelText: 'Designation',
                              hintText: 'Select designation',
                              onChanged: (value) {
                                _controller.selectedDesignation(value);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please select a designation";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // ... (remaining code)
            ]),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height / 18,
        child: commonbutton(
            OnPress: () async {
              if (_key.currentState!.validate()) {
                final data = mobileNumberController.text;
                Get.to(
                    transition: Transition.leftToRightWithFade,
                    duration: Duration(seconds: 1),
                    () => Bottom_Screen());
              }
            },
            title: 'Update'),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class ImagePickerService {
  void pickCropImage(
      {required CropAspectRatio CropAspectRatio,
      required ImageSource ImageSource}) {}
}
