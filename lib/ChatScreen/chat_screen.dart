import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/ChatScreen/chat_message_screen.dart';
import 'package:rent_straight_tenent/Favorite/favorite_screen.dart';
import 'package:rent_straight_tenent/HomeScreen/home_screen.dart';
import 'package:rent_straight_tenent/ProfileScreen/UserProfileScreen.dart';
import 'package:rent_straight_tenent/Settings/settings_screen.dart';
import 'package:rent_straight_tenent/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen()));

                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/images/fred.png")
                          )

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
                          Text("My Chats ", style: TextStyle(fontSize: 32, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w400, height: 1.2, ),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),


                  Row(
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
                                    labelText: "Search chat",

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
                          child: Image.asset("assets/images/lets-icons_filter.png")),
                    ],
                  ),







                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                      itemBuilder: (context, index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatMessageScreen()));

                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage("assets/images/fred.png"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Mr. Fred Fafa", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                                        Text("Tomorrow Is Fine", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("7:26 PM", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.grey.withOpacity(0.5)),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: rentPrimary,
                                      child: Text("1", style: TextStyle(color: Colors.white, fontSize: 12),),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          ),
                        );
                      }
                  )
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SettingsScreen()));
                        },
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                //color: rentPrimary,
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



}
