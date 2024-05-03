import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/Auth/SignUp/upload_photo.dart';
import 'package:rent_straight_tenent/Components/keyboard_utils.dart';
import 'package:rent_straight_tenent/HomeScreen/home_screen.dart';
import 'package:rent_straight_tenent/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class EmailVerification extends StatefulWidget {
  final full_name;
  final username;
  final email;
  final contact_number;

  const EmailVerification({super.key,

    required this.full_name,
    required this.username,
    required this.email,
    required this.contact_number,

  });

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final _formKey = GlobalKey<FormState>();
  var show_password = false;
  bool hasError = false;

  String email_token = "";
  TextEditingController controller = TextEditingController(text: "");


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Stack(
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Image.asset("assets/images/rent_logo.png"),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.full_name +",", style: TextStyle(fontSize: 36, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2),),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Verify your account", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1)),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),


                  Expanded(
                      child: ListView(
                        children: [
                          Container(
                            child: Column(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child:Form(
                                    //key: _formKey,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      //color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,

                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: PinCodeTextField(
                                                    autofocus: true,
                                                    controller: controller,
                                                    hideCharacter: false,
                                                    highlight: true,
                                                    highlightColor: Colors.black,
                                                    defaultBorderColor:
                                                    Colors.grey.withOpacity(0.3),
                                                    hasTextBorderColor:
                                                    Colors.grey.withOpacity(0.2),
                                                    highlightPinBoxColor: Colors.white.withOpacity(0.3),
                                                    pinBoxColor: Colors.white.withOpacity(0.3),
                                                    pinBoxRadius: 10,
                                                    keyboardType: TextInputType.text,
                                                    maxLength:4,
                                                    //maskCharacter: "😎",
                                                    onTextChanged: (text) {
                                                      setState(() {
                                                        hasError = false;
                                                      });
                                                    },
                                                    onDone: (text) {
                                                      print("DONE $text");
                                                      print("DONE CONTROLLER ${controller.text}");
                                                      email_token=text.toString();
                                                    },
                                                    pinBoxWidth: 70,
                                                    pinBoxHeight: 70,
                                                    //hasUnderline: true,
                                                    wrapAlignment: WrapAlignment.spaceAround,
                                                    pinBoxDecoration: ProvidedPinBoxDecoration
                                                        .defaultPinBoxDecoration,
                                                    pinTextStyle: TextStyle(fontSize: 25.0),
                                                    pinTextAnimatedSwitcherTransition:
                                                    ProvidedPinBoxTextAnimation
                                                        .scalingTransition,
                                                    pinTextAnimatedSwitcherDuration:
                                                    Duration(milliseconds: 300),
                                                    highlightAnimationBeginColor: Colors.black,
                                                    highlightAnimationEndColor: Colors.white12,
                                                  ),
                                                ),

                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),


                                SizedBox(
                                  height: 30,
                                ),

                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),

                                  child: InkWell(
                                    onTap: () {
                                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadPhoto(full_name: widget.full_name)));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Didn’t receive the code? ",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          "Resend OTP",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600, color: rentPrimary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 30,
                                ),

                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),

                                  child: InkWell(
                                    onTap: () {

                                      /*         if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        KeyboardUtil.hideKeyboard(context);

                                        //_futureSignIn = signInUser(email!, password!);
                                        //_futureSignIn = signInUser(user!, password!, platformType!);


                                        _showLoadingDialogModal(context);
                                      }*/

                                      _showLoadingDialogModal(context);

                                      Timer(
                                          Duration(seconds: 4),
                                              () {
                                            Navigator.of(context).pop();
                                            _showSuccessDialogModal(context);
                                          }
                                      );


                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      //margin: EdgeInsets.all(10),
                                      height: 59,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: rentPrimary,
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text(
                                          "Verify",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ],
                      )
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }


  void _showLoadingDialogModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/rent_logo.png"),
                    SizedBox(
                      width: 10,
                    ),

                    Text("RentStraight", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, height: 1.2),),


                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Text("is confirming your verification code", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, height: 1.2),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RotationTransition(
                      turns: _controller,
                      child: Image.asset(
                        "assets/icons/loading.png",
                        color: Colors.black,

                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSuccessDialogModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/rent_logo.png"),
                    SizedBox(
                      width: 10,
                    ),

                    Text("RentStraight", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, height: 1.2),),


                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Text("Your code has been verified !", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, height: 1.2),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.check_circle_outline_rounded, color: Colors.green, size: 55,),
                  ],
                ),
                InkWell(
                  onTap: () {

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()),
                          (route) => false,
                    );

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          //margin: EdgeInsets.all(10),
                          height: 59,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Continue",
                                style: TextStyle(color: rentPrimary),
                              ),
                              Icon(Icons.arrow_forward_rounded, color: rentPrimary,)

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}