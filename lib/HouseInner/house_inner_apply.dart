import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/constants.dart';

class HouseInnerApply extends StatefulWidget {
  const HouseInnerApply({super.key});

  @override
  State<HouseInnerApply> createState() => _HouseInnerApplyState();
}

class _HouseInnerApplyState extends State<HouseInnerApply> {

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
                            padding: const EdgeInsets.all(8.0),
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

              Text("Upload documents relevant to your application", style: TextStyle(fontSize: 14, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
              SizedBox(
                height: 20,
              ),

              Container(
                height: 300,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,

                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Duration", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                                       SizedBox(
                                         height: 10,
                                       ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.5),
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                              child: Icon(Icons.calendar_month_rounded, color: Colors.green,),
                                            ),
                                            Row(
                                              children: [
                                                Text("year", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                                                Icon(Icons.arrow_drop_down_outlined)
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.5),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child:Center(child: Text("-", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, color: rentPrimary),)),

                                        ),
                                        Text("3", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w600, height: 1.2, color: Colors.white),),

                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.5),
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child:Center(child: Text("+", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, color: rentPrimary),)),

                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: rentLightblue,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage("assets/images/contact.png")),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Add Emergency Contact", textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        )
                    ),
                    Expanded(
                      flex: 4,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: rentCream,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Documents", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                              SizedBox(
                                height: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text("Referral", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/pdficon.png")
                                              )
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Referee", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                                        ],
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(100),
                                  
                                        ),
                                        child: Center(child: Text("+", style: TextStyle(color: Colors.white, fontSize: 30),)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Bank Statement", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: AssetImage("assets/images/pdficon.png")
                                                )
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Statement", style: TextStyle(fontSize: 12, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2,),),
                                        ],
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(100),

                                        ),
                                        child: Center(child: Text("+", style: TextStyle(color: Colors.white, fontSize: 30),)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                    ),
                  ],
                ),
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



                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            //margin: EdgeInsets.all(10),
                           // height: 59,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
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
