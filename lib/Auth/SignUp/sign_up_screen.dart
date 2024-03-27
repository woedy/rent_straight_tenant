import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/Auth/SignUp/email_verification.dart';
import 'package:rent_straight_tenent/Components/keyboard_utils.dart';
import 'package:rent_straight_tenent/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var show_password = false;

  //Future<SignInModel>? _futureSignIn;
  FocusNode focusNode = FocusNode();

  String? email;
  String? password;

  String? full_name;
  String? phone;
  String? _code;
  String? _number;
  String? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Image.asset("assets/images/rent_logo.png"),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 64,
                              fontFamily: "MontserratAlternates",
                              fontWeight: FontWeight.w500,
                              height: 1.2),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Lets get you started",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "MontserratAlternates",
                                fontWeight: FontWeight.w500,
                                height: 1.1)),
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
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.1))),
                                          child: TextFormField(
                                            style: TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              //hintText: 'Enter Username/Email',

                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.normal),
                                              labelText: "Full name",
                                              labelStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                              border: InputBorder.none,
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  225),
                                              PasteTextInputFormatter(),
                                            ],
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Full name is required';
                                              }
                                              if (value.length < 3) {
                                                return 'Full name too short';
                                              }
                                            },
                                            textInputAction: TextInputAction.next,
                                            autofocus: false,
                                            onSaved: (value) {
                                              setState(() {
                                                //full_name = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.1))),
                                          child: TextFormField(
                                            style: TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              //hintText: 'Enter Username/Email',

                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.normal),
                                              labelText: "Email",
                                              labelStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                              border: InputBorder.none,
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  225),
                                              PasteTextInputFormatter(),
                                            ],
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Email is required';
                                              }

                                              String pattern =
                                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                                  r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                                  r"{0,253}[a-zA-Z0-9])?)*$";
                                              RegExp regex = RegExp(pattern);
                                              if (!regex.hasMatch(value))
                                                return 'Enter a valid email address';

                                              return null;
                                            },
                                            textInputAction: TextInputAction.next,
                                            autofocus: false,
                                            onSaved: (value) {
                                              setState(() {
                                                email = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.1))),
                                          child: TextFormField(
                                            style: TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              //hintText: 'Enter Username/Email',

                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.normal),
                                              labelText: "Username",
                                              labelStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                              border: InputBorder.none,
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  225),
                                              PasteTextInputFormatter(),
                                            ],
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Full name is required';
                                              }
                                              if (value.length < 3) {
                                                return 'Full name too short';
                                              }
                                            },
                                            textInputAction: TextInputAction.next,
                                            autofocus: false,
                                            onSaved: (value) {
                                              setState(() {
                                                //full_name = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IntlPhoneField(
                                          focusNode: focusNode,
                                          style: TextStyle(color: Colors.black),
                                          dropdownIcon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          ),
                                          decoration: InputDecoration(
                                              // labelText: 'Phone Number',
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              enabledBorder:
                                                  new OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(0.1)),
                                              ),
                                              focusedBorder:
                                                  new OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(0.1)),
                                              )),
                                          languageCode: "en",
                                          initialCountryCode: "GH",
                                          validator: (e) {
                                            if (e == null) {
                                              return 'Phone Number required';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            _code = value.countryCode.toString();
                                            _number = value.number.toString();
                                            country =
                                                value.countryISOCode.toString();
                                          },
                                          onCountryChanged: (country) {},
                                          onSaved: (value) {
                                            //_onSaveForm(value.toString());
                                            setState(() {
                                              _code =
                                                  value!.countryCode.toString();
                                              _number = value.number.toString();
                                              country =
                                                  value.countryISOCode.toString();
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
        /*
                                            if (_formKey.currentState!.validate()) {
                                              _formKey.currentState!.save();
                                              KeyboardUtil.hideKeyboard(context);

                                              //_futureSignIn = signInUser(email!, password!);
                                              //_futureSignIn = signInUser(user!, password!, platformType!);


                                            }*/

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EmailVerification()));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        //margin: EdgeInsets.all(10),
                                        height: 59,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: rentPrimary,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account? ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "Sign in here",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: rentPrimary),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
