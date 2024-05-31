import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/Components/keyboard_utils.dart';
import 'package:rent_straight_tenent/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UserProfileScreen.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
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



  Map<String, dynamic> userData = {};


  @override
  void initState() {
    super.initState();
    // Retrieve data from SharedPreferences
    getUserData();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
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
                    Row(
                      children: [
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserProfileScreen()),
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            userData["avatar"].toString(),
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Container(
                                color: Colors.grey,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
        
              SizedBox(
                height: 20,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        userData["avatar"].toString(),
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return Container(
                            color: Colors.grey,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
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
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
        
        
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black.withOpacity(0.1))),
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
                                                  color: Colors.black.withOpacity(0.5)),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.white)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.white)),
                                              border: InputBorder.none,
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(225),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
        
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: Colors.black.withOpacity(0.1))),
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
                                                  color: Colors.black.withOpacity(0.5)),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.white)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.white)),
                                              border: InputBorder.none,
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(225),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
        
        
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black.withOpacity(0.1))),
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
                                                  color: Colors.black.withOpacity(0.5)),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.white)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.white)),
                                              border: InputBorder.none,
                                            ),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(225),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
        
                                      children: [
        
                                        IntlPhoneField(
                                          focusNode: focusNode,
                                          style: TextStyle(color: Colors.black),
                                          dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.grey,),
                                          decoration: InputDecoration(
                                            // labelText: 'Phone Number',
                                              border: OutlineInputBorder(
        
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              enabledBorder:  new OutlineInputBorder(
                                                borderSide:  BorderSide(color: Colors.black.withOpacity(0.1)),
        
                                              ),
                                              focusedBorder:  new OutlineInputBorder(
                                                borderSide:  BorderSide(color: Colors.black.withOpacity(0.1)),
                                              )
                                          ),
                                          languageCode: "en",
                                          initialCountryCode: "GH",
                                          validator: (e){
                                            if(e == null){
                                              return 'Phone Number required';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            _code = value.countryCode.toString();
                                            _number = value.number.toString();
                                            country = value.countryISOCode.toString();
                                          },
                                          onCountryChanged: (country) {
        
                                          },
        
                                          onSaved: (value) {
                                            //_onSaveForm(value.toString());
                                            setState(() {
                                              _code = value!.countryCode.toString();
                                              _number = value.number.toString();
                                              country = value.countryISOCode.toString();
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
        
        
                                        }
        */

                                        Navigator.of(context).pop();

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
                                            "Continue",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
        ),
      ),
    );
  }




  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataString = prefs.getString('user_data') ?? '';
    setState(() {
      userData = json.decode(userDataString);
    });
  }

}
