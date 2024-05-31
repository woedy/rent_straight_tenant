import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/Auth/SignIn/sign_in_screen.dart';
import 'package:rent_straight_tenent/ChatScreen/chat_screen.dart';
import 'package:rent_straight_tenent/FAQs/faq_screen.dart';
import 'package:rent_straight_tenent/Favorite/favorite_screen.dart';
import 'package:rent_straight_tenent/HomeScreen/home_screen.dart';
import 'package:rent_straight_tenent/InviteFriend/invite_friend.dart';
import 'package:rent_straight_tenent/Privacy/privacy_code.dart';
import 'package:rent_straight_tenent/ProfileScreen/UserProfileScreen.dart';
import 'package:rent_straight_tenent/ProfileScreen/edit_profile.dart';
import 'package:rent_straight_tenent/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;



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
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                      child: Image.asset("assets/images/jam_menu.png")),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: rentPrimary,),
                      Text("Adenta, Accra", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2),),
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
              SizedBox(
                height: 20,
              ),

              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("My Settings ", style: TextStyle(fontSize: 32, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w400, height: 1.2, ),),
                        ],
                      ),
                    ],
                  ),


                ],
              ),
              SizedBox(
                height: 20,
              ),

              Expanded(
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
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
                        SizedBox(
                          width: 20,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userData["full_name"].toString(), style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                            SizedBox(
                              height: 10,
                            ),

                            Text(userData["email"].toString(), style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EditUserProfile()));

                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.account_circle_rounded, size: 50, color: Colors.black,),
                                   SizedBox(
                                     width: 20,
                                   ),
                                    Text("Account", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),)


                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PrivacyCode()));

                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.lock, size: 50, color: Colors.black,),
                                   SizedBox(
                                     width: 20,
                                   ),
                                    Text("Privacy", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),)


                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FAQScreens()));

                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.help_outlined, size: 50, color: Colors.black,),
                                   SizedBox(
                                     width: 20,
                                   ),
                                    Text("Help", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),)


                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => InviteFriendScreen()));

                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.person_add_rounded, size: 50, color: Colors.black,),
                                   SizedBox(
                                     width: 20,
                                   ),
                                    Text("Invite your friend", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),)


                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),



                            ],
                          ),
                        ),


                      ],
                    ),

                    InkWell(
                      onTap: () {



                        clearApiKey();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                              (route) => false,
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
                            "Logout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),


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
        ),
      ),
    );
  }

  Future<void> clearApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("API_Key");
    await prefs.remove("user_data");
  }


  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataString = prefs.getString('user_data') ?? '';
    setState(() {
      userData = json.decode(userDataString);
    });
  }






}
