import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/ChatScreen/chat_screen.dart';
import 'package:rent_straight_tenent/HomeScreen/home_screen.dart';
import 'package:rent_straight_tenent/HouseInner/house_inner_1.dart';
import 'package:rent_straight_tenent/ProfileScreen/UserProfileScreen.dart';
import 'package:rent_straight_tenent/Settings/settings_screen.dart';
import 'package:rent_straight_tenent/constants.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

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
                          Text("My Favorites ", style: TextStyle(fontSize: 32, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w400, height: 1.2, ),),
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
                                    labelText: "Search house",

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
                height: 15,
              ),

              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildNavItem2("assets/images/streamline_cards.png", 0, ),
                        buildNavItem2("assets/images/mdi_cards-variant.png", 1, ),
                        buildNavItem2("assets/images/cil_list.png", 2, ),

                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: PageView(

                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            currentPage = page;
                          });
                        },
                        children: [
                          _houses_page(),
                          _houses_scroll(),
                          _houses_list()
                          // Add more pages as needed
                        ],
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
                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FavoriteScreen()));
                      },
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: rentPrimary,
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

  Widget buildNavItem2(String image, int pageIndex) {
    bool isSelected = currentPage == pageIndex;

    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          pageIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? rentPrimary : null,
          borderRadius: BorderRadius.circular(15),
        ),
        child:Image.asset(image, color: isSelected ? Colors.white : Colors.black,),
      ),
    );
  }


  Widget _houses_page (){
    return ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.only(right: 10),
            child:    InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

              },
              child: Container(
                //color: Colors.red,
                  height: 350,
                  width: MediaQuery.of(context).size.width - 30,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/house_in.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.favorite, color: Colors.white,)
                                      ],
                                    ),
                                  ),

                                  Expanded(child: Container()),

                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("St.Patrick Estate", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),
                                                  Text("Ritz, Adenta | 3.5Km away", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),
                                                ],
                                              ),
                                              Container(
                                                width: 80,
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Colors.green.withOpacity(0.5),
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                                              )
                                            ],
                                          ),
                                        ),


                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.bed,color: Colors.white, size: 30,),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.food_bank,color: Colors.white, size: 30,),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("1", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.bathtub_rounded,color: Colors.white, size: 30,),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

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
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
          );
        }

    );
  }
  Widget _houses_scroll (){
    return ListView.builder(

        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            child:    InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

              },
              child: Container(
                //color: Colors.red,
                  height: 350,
                  width: MediaQuery.of(context).size.width - 30,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/house_in.png"),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.favorite, color: Colors.white,)
                                      ],
                                    ),
                                  ),

                                  Expanded(child: Container()),

                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("St.Patrick Estate", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),
                                                  Text("Ritz, Adenta | 3.5Km away", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),
                                                ],
                                              ),
                                              Container(
                                                width: 80,
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Colors.green.withOpacity(0.5),
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                                              )
                                            ],
                                          ),
                                        ),


                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.bed,color: Colors.white, size: 30,),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.food_bank,color: Colors.white, size: 30,),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("1", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.bathtub_rounded,color: Colors.white, size: 30,),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("3", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

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
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
          );
        }

    );
  }

  Widget _houses_list (){
    return ListView(
      children: [

        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInner1()));

            },
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
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                      ),
                      SizedBox(
                        height: 10,
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
        ),
        Container(
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
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                    ),
                    SizedBox(
                      height: 10,
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
        Container(
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
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Text("Available", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", color: Colors.green),)),

                    ),
                    SizedBox(
                      height: 10,
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
      ],
    );
  }

}