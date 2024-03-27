import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/ChatScreen/chat_message_screen.dart';
import 'package:rent_straight_tenent/HouseInner/house_inner_apply.dart';
import 'package:rent_straight_tenent/Landloard/call_landloard.dart';
import 'package:rent_straight_tenent/Landloard/landloard.dart';
import 'package:rent_straight_tenent/constants.dart';

class HouseInner1 extends StatefulWidget {
  const HouseInner1({super.key});

  @override
  State<HouseInner1> createState() => _HouseInner1State();
}

class _HouseInner1State extends State<HouseInner1> {

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
                        image: AssetImage("assets/images/fred.png"),
                        fit: BoxFit.cover
                      )

                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

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
              SizedBox(
                height: 20,
              ),

              Container(
                padding: EdgeInsets.all(10),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("St.Patrick Estate", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Ritz, Adenta | 3.5Km away", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                          ],
                        ),

                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CallLandlord()));

                          },
                            child: Icon(Icons.call, color: rentPrimary, size: 20,))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("This is a stunning house with not just a stunning view, but one of the best, carefully selected neighbours", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Landlord", style: TextStyle(fontSize: 8, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: rentPrimary),),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LandlordProfile()));

                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundImage: AssetImage("assets/images/kirk2.png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),

                                  Text("Mr. Kirk Wolf", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w400, height: 1.2,),),
                                ],
                              ),
                            ),
                            Text("Download Policy", style: TextStyle(fontSize: 10,   decoration: TextDecoration.underline, decorationColor: rentPrimary, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: rentPrimary),),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
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
                child:Row(
                  children: [
                    Expanded(
                      flex:2,
                      child: Container(
                       height: 110,
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                         //color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("assets/images/map.png"),
                              fit: BoxFit.contain
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatMessageScreen()));

                        },
                        child: Container(
                          height: 110,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(image: AssetImage("assets/images/hadshaake.png")),
                              Text("Book a meetup", style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w400, height: 1.2,),),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(
                height: 20,
              ),

              Container(
               // padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                 // color: Colors.red,


                ),
                child:  Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ghc300", style: TextStyle(fontSize: 32, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w700, height: 1.2, ),),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Per Month", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),

                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HouseInnerApply()));



                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            //margin: EdgeInsets.all(10),
                           // height: 59,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: rentPrimary,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Apply",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }


}
