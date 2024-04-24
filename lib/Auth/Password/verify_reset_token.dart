import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/Auth/Password/models/verify_pasword_token_model.dart';
import 'package:rent_straight_tenent/Auth/Password/reset_password.dart';
import 'package:rent_straight_tenent/Auth/SignUp/upload_photo.dart';
import 'package:rent_straight_tenent/Components/keyboard_utils.dart';
import 'package:rent_straight_tenent/HomeScreen/home_screen.dart';
import 'package:rent_straight_tenent/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'package:http/http.dart' as http;


Future<VerifyResetTokenModel> verifyResetToken(String email, String token) async {

  final response = await http.post(
    Uri.parse(hostName + "verify-reset-token"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode({
      "email": email,
      "token": token,
    }),
  );


  if (response.statusCode == 201 || response.statusCode == 200) {
    print(jsonDecode(response.body));
    return VerifyResetTokenModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return VerifyResetTokenModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return VerifyResetTokenModel.fromJson(jsonDecode(response.body));
  }  else {
    print(jsonDecode(response.body));
    throw Exception('Failed to load data');
  }
}


class VerifyResetToken extends StatefulWidget {

  final email;


  const VerifyResetToken({super.key,
    required this.email,
  });

  @override
  State<VerifyResetToken> createState() => _VerifyResetTokenState();
}

class _VerifyResetTokenState extends State<VerifyResetToken> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final _formKey = GlobalKey<FormState>();
  var show_password = false;
  bool hasError = false;

  String email_token = "";
  TextEditingController controller = TextEditingController(text: "");

  Future<VerifyResetTokenModel>? _futureVerifyReset;


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
    return (_futureVerifyReset == null) ? buildColumn() : buildFutureBuilder();
  }

  buildColumn (){
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
                        Text("Verify Reset Token", style: TextStyle(fontSize: 36, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2),),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Enter the reset token here", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, height: 1.1)),
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
                                                    maxLength:6,
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
                                                    pinBoxWidth: 51,
                                                    pinBoxHeight: 51,
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


                                      setState(() {
                                        _futureVerifyReset = verifyResetToken(widget.email!, email_token);

                                      });




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


  FutureBuilder<VerifyResetTokenModel> buildFutureBuilder() {
    return FutureBuilder<VerifyResetTokenModel>(
        future: _futureVerifyReset,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showLoadingDialogModal(context);
            });
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);


            if(data.message == "Reset token verified successfully") {


              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                _showSuccessDialogModal(context);

                setState(() {
                  _futureVerifyReset = null; // Reset _futureSignIn here
                });


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        ResetPasswordScreen(
                            email: widget.email, token: email_token)),
                  );
                });







            }

            else {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                _showErrorDialogModal(context, data);

                setState(() {
                  _futureVerifyReset = null; // Reset _futureSignIn here
                });




              });

            }



          }

          return Scaffold(
            body:Container(),
          );


        }
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

                Text("is verifying token", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, height: 1.2),),
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

  void _showErrorDialogModal(BuildContext context, VerifyResetTokenModel model) {
    List<Widget> errorWidgets = [];
    if (model.errors != null) {
      if (model.errors!.email != null) {
        model.errors!.email!.forEach((error) {
          errorWidgets.add(Text(error));
        });
      }

      if (model.errors!.token != null) {
        model.errors!.token!.forEach((error) {
          errorWidgets.add(Text(error));
        });
      }
    }

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
                    SizedBox(width: 10),
                    Text(
                      "RentStraight",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: errorWidgets,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.highlight_remove, color: Colors.red, size: 50),
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
            decoration: BoxDecoration(
              /*      image: DecorationImage(
                image: AssetImage("assets/images/sprinkles.png"),
                fit: BoxFit.cover
              )*/
            ),
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

                Text("Code Verified", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, height: 1.2),),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.check_circle_outline_rounded, color: Colors.green, size: 55,),
                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }

}
