import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/Components/keyboard_utils.dart';
import 'package:rent_straight_tenent/Landloard/landloard.dart';
import 'package:rent_straight_tenent/ProfileScreen/UserProfileScreen.dart';
import 'package:rent_straight_tenent/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({super.key});

  @override
  State<ChatMessageScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
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
                        Navigator.pop(context);
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LandlordProfile()));

                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/kirk.png"),
                            radius: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Mr Kirk Wolf", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                        ],
                      ),
                    ),
                    Icon(Icons.attachment_rounded, color: rentPrimary,)
                  ],
                ),
              ),

              Expanded(
                  child: ListView(
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 300,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: rentCream,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              )
                          ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text("Hi, there, when will you be avalable to meet up in person", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),)),
                             CircleAvatar(
                               backgroundImage: AssetImage("assets/images/fred.png"),
                             )
                              ],
                            )),
                      ],
                    ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: 300,
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: rentLightblue,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  )
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/fred.png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(child: Text("Tomorrow is fine", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),)),

                                ],
                              )),
                        ],
                      ),
                    ],
                  )
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border:
                          Border.all(color: Colors.black.withOpacity(0.1)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  //hintText: 'Enter Username/Email',

                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.normal),
                                  labelText: "Enter your message here",

                                  labelStyle: TextStyle(fontSize: 13,
                                      color: Colors.black.withOpacity(0.5)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)),
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(225),
                                  PasteTextInputFormatter(),
                                ],

                                textInputAction: TextInputAction.next,
                                autofocus: false,
                                onSaved: (value) {
                                  setState(() {
                                    //email = value;
                                  });
                                },
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: rentPrimary,
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
                        child: Icon(Icons.send, color: Colors.white, size: 30,)),
                  ],
                ),
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
