import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/HouseInner/house_inner_1.dart';
import 'package:rent_straight_tenent/ProfileScreen/edit_profile.dart';
import 'package:rent_straight_tenent/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

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
              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/fred.png"),
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
                height: 20,
              ),



              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
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
                        child: Column(
                          children: [
                            Text("5", style: TextStyle(fontSize: 24, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: rentPrimary),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Listing", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),

                          ],
                        )),
                    Container(
                        padding: EdgeInsets.all(20),
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
                        child: Column(
                          children: [
                            Text("4.5", style: TextStyle(fontSize: 24, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: rentPrimary),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Rating", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),

                          ],
                        )),
                    Container(
                        padding: EdgeInsets.all(20),
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
                        child: Column(
                          children: [
                            Text("50", style: TextStyle(fontSize: 24, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: rentPrimary),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Followers", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),

                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: InkWell(
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserProfile()));


                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    //margin: EdgeInsets.all(10),

                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: rentPrimary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                    itemBuilder: (context, index){
                      return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

                          },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/house_in.png"),
                                        fit: BoxFit.cover
                                    )

                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start ,
                                  children: [
                                    Text("St.Patrick Estate", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                                    Text("Ritz, Adenta | 3.5Km away", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", height: 1.2,),),
                                    SizedBox(
                                      height: 30,
                                    ),


                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.bed,color: Colors.black, size: 30,),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.black),),

                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.food_bank,color: Colors.black, size: 30,),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("1", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.black),),

                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.bathtub_rounded,color: Colors.black, size: 30,),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.black),),

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              )


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
