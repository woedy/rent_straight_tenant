import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/Auth/SignUp/upload_photo.dart';
import 'package:rent_straight_tenent/Components/keyboard_utils.dart';
import 'package:rent_straight_tenent/HomeScreen/home_screen.dart';
import 'package:rent_straight_tenent/Privacy/privacy_password.dart';
import 'package:rent_straight_tenent/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PrivacyCode extends StatefulWidget {
  const PrivacyCode({super.key});

  @override
  State<PrivacyCode> createState() => _PrivacyCodeState();
}

class _PrivacyCodeState extends State<PrivacyCode> with SingleTickerProviderStateMixin {
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

                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 1), // changes position of shadow
                              ),
                            ],

                          ),
                          child: Icon(Icons.arrow_back, color: rentPrimary, size: 40,)),
                    ),
                  ),
        
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mr.Fred Fafa, ", style: TextStyle(fontSize: 36, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2),),
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
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                                              children: [
                                                PinCodeTextField(
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
                                                  maxLength: 4,
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
                                                  pinBoxWidth: 80,
                                                  pinBoxHeight: 80,
                                                  //hasUnderline: true,
                                                  wrapAlignment: WrapAlignment.spaceAround,
                                                  pinBoxDecoration: ProvidedPinBoxDecoration
                                                      .defaultPinBoxDecoration,
                                                  pinTextStyle: TextStyle(fontSize: 35.0),
                                                  pinTextAnimatedSwitcherTransition:
                                                  ProvidedPinBoxTextAnimation
                                                      .scalingTransition,
                                                  pinTextAnimatedSwitcherDuration:
                                                  Duration(milliseconds: 300),
                                                  highlightAnimationBeginColor: Colors.black,
                                                  highlightAnimationEndColor: Colors.white12,
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
                                      //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => OnboardingScreen()));
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

                    Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPassword()));


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