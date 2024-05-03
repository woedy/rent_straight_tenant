import 'dart:async';
import 'dart:convert';

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
import 'package:shared_preferences/shared_preferences.dart';

class FAQScreens extends StatefulWidget {
  const FAQScreens({super.key});

  @override
  State<FAQScreens> createState() => _FAQScreensState();
}

class _FAQScreensState extends State<FAQScreens> with SingleTickerProviderStateMixin {
  late AnimationController _controller;






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
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(userData["avatar"]),
                                  fit: BoxFit.cover
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
                        Text("FAQ's", style: TextStyle(fontSize: 36, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2),),
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
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: rentCream,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("What is Rentstraight? ", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w700, height: 1.2),),
                                Icon(Icons.arrow_drop_down_outlined)
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: rentCream,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("What is Rentstraight? ", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w700, height: 1.2),),
                                Icon(Icons.arrow_drop_down_outlined)
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: rentCream,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("What is Rentstraight? ", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w700, height: 1.2),),
                                Icon(Icons.arrow_drop_down_outlined)
                              ],
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


  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataString = prefs.getString('user_data') ?? '';
    setState(() {
      userData = json.decode(userDataString);
    });
  }




}
