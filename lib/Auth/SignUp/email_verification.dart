import 'dart:async';
import 'dart:convert';

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
import 'package:http/http.dart' as http;

import 'models/verify_email_model.dart';


Future<VerifyEmailModel> verify_email(String email_token) async {
  var token = await getApiPref();



  final response = await http.post(
    Uri.parse(hostName + "email/verify-token/"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer '  + token.toString()

    },
    body: jsonEncode({
      "token": email_token,
    }),
  );


  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    final result = json.decode(response.body);

    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }   else if (response.statusCode == 400) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to Load data');
  }
}

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
  bool _isLoading = false; // Add a boolean flag to track loading state


  String email_token = "";
  TextEditingController controller = TextEditingController(text: "");
  Future<VerifyEmailModel>? _futureVerifyEmail;
  String? token;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();



  }




  @override
  Widget build(BuildContext context) {
    return (_futureVerifyEmail == null) ? buildColumn() : buildFutureBuilder(context);
  }






  buildColumn(){
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
                                    key: _formKey,
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
                                    onTap: () async {
                                      // Show the loading dialog
                                      _showLoadingDialogModal(context);

                                      // Get the token
                                      var token = await getApiPref();

                                      if (token == null) {
                                        print('Token is null');
                                        Navigator.pop(context); // Close the loading dialog
                                        // Show an error message to the user
                                        return;
                                      }

                                      const String url = hostName + 'email/resend-verification-token';
                                      final Map<String, String> headers = {
                                        'Content-Type': 'application/json',
                                        'Authorization': 'Bearer $token',
                                      };

                                      try {
                                        final response = await http.post(
                                          Uri.parse(url),
                                          headers: headers,
                                        );

                                        Navigator.pop(context); // Close the loading dialog

                                        if (response.statusCode == 200 || response.statusCode == 201) {
                                          // Handle success response
                                          print('OTP resent successfully.');
                                          // Show a success message to the user
                                          _showSuccessDialogModal2(context, "OTP resent successfully");
                                        } else {
                                          // Handle error response
                                          print('Failed to resend OTP. Error: ${response.body}');
                                          // Show an error message to the user
                                        }
                                      } catch (e) {
                                        Navigator.pop(context); // Close the loading dialog
                                        // Handle network error
                                        print('Network error: $e');
                                        // Show a network error message to the user
                                      }
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
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue, // Replace rentPrimary with actual color
                                          ),
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

                                               if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        KeyboardUtil.hideKeyboard(context);

                                        _futureVerifyEmail = verify_email(email_token);


                                      }

                                     /* _showLoadingDialogModal(context);

                                      Timer(
                                          Duration(seconds: 4),
                                              () {
                                            Navigator.of(context).pop();
                                            _showSuccessDialogModal(context);
                                          }
                                      );
*/

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


  FutureBuilder<VerifyEmailModel> buildFutureBuilder(context) {

    return FutureBuilder<VerifyEmailModel>(
        future: _futureVerifyEmail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting && !_isLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showLoadingDialogModal(context);
            });
          }
          if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);
            print(data.message);

            if(data.message == "Email verified successfully") {

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                _showSuccessDialogModal(context, "Your code has been verified !");

          /*      Future.delayed(Duration(milliseconds: 500), () {


                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen()),
                        (route) => false,
                  );
                });*/
              });


            }
            else if (data.message == "Invalid Request.") {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pop(context);
                //Navigator.pop(context);
                //Navigator.pop(context);

                _showErrorDialogModal(context, data );

                setState(() {

                  _futureVerifyEmail = null; // Reset _futureSignIn here
                });

              });

            }else {
              //_showErrorDialogModal(context, "Failed to load data");
            }

          }




          return Scaffold(
            body: Container(),
          );

        }
    );
  }


  @override
  void dispose() {
    _controller.dispose(); // Dispose of the AnimationController
    super.dispose();
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

  void _showSuccessDialogModal(BuildContext context, message) {
    showModalBottomSheet(
      context: context,
        isDismissible: false,
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

                Text(message, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, height: 1.2),),
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


  void _showSuccessDialogModal2(BuildContext context, message) {
    showModalBottomSheet(
      context: context,
      //isDismissible: false,
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

                Text(message, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, height: 1.2),),
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

  void _showErrorDialogModal(BuildContext context, VerifyEmailModel model) {
    List<Widget> errorWidgets = [];
    if (model.errors != null) {
      if (model.errors!.token != null) {
        model.errors!.token!.forEach((error) {
          errorWidgets.add(Text(error, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, height: 1.2),));
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



}