import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/Auth/SignUp/upload_photo.dart';
import 'package:rent_straight_tenent/ChatScreen/chat_screen.dart';
import 'package:rent_straight_tenent/Components/keyboard_utils.dart';
import 'package:rent_straight_tenent/Favorite/favorite_screen.dart';
import 'package:rent_straight_tenent/HomeScreen/home_screen.dart';
import 'package:rent_straight_tenent/Privacy/privacy_password.dart';
import 'package:rent_straight_tenent/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class InviteFriendScreen extends StatefulWidget {
  const InviteFriendScreen({super.key});

  @override
  State<InviteFriendScreen> createState() => _InviteFriendScreenState();
}

class _InviteFriendScreenState extends State<InviteFriendScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;






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
                    padding: const EdgeInsets.all(10.0),
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

                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/fred.png")
                              )

                          ),
                        )
                      ],
                    ),
                  ),
        
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Invite a friend", style: TextStyle(fontSize: 36, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2),),
           ],
                    ),
                  ),
                  
                  SizedBox(
                    height: 20,
                  ),
        
        
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.4))),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                //hintText: 'Enter Username/Email',

                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent)),
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
                                  //email = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {

                                /*       if (_formKey.currentState!.validate()) {
                                                _formKey.currentState!.save();
                                                KeyboardUtil.hideKeyboard(context);

                                                //_futureSignIn = signInUser(email!, password!);
                                                //_futureSignIn = signInUser(user!, password!, platformType!);


                                              }*/

                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));


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
                                    "Invite",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      )
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),


                    decoration: BoxDecoration(
                      color: rentDark,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                          },
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    // color: rentPrimary,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Icon(Icons.home, color: Colors.white, size: 30 ,))
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            /*      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
                      */  },
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: rentPrimary,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Icon(Icons.settings, color: Colors.white, size: 30 ,))
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FavoriteScreen()));
                          },
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    //color: rentPrimary,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Icon(Icons.favorite, color: Colors.white, size: 30 ,))
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));
                          },
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    //color: rentPrimary,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Icon(Icons.message, color: Colors.white, size: 30 ,))
                            ],
                          ),
                        ),



                      ],
                    ),
                  )
        
                ],
              ),
        
            ],
          ),
        ),
      ),
    );
  }




}
