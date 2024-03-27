import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/constants.dart';

class CallLandlord extends StatefulWidget {
  const CallLandlord({super.key});

  @override
  State<CallLandlord> createState() => _CallLandlordState();
}

class _CallLandlordState extends State<CallLandlord> {

  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/kirk.png"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
          /*  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        //color: Colors.white,
                        borderRadius: BorderRadius.circular(20),


                    ),
                    child: Icon(Icons.arrow_back, color: rentPrimary, size: 40,)),
                Row(
                  children: [
         ],
                ),

              ],
            ),*/
            SizedBox(
              height: 20,
            ),

            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/kirk2.png"),
            ),
            SizedBox(
              height: 20,
            ),

            Text("Mr. Kirk Wolf", style: TextStyle(fontSize: 20, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),
            SizedBox(
              height: 10,
            ),

            Text("00:34:16", style: TextStyle(fontSize: 15, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2, color: Colors.white),),

            SizedBox(
              height: 20,
            ),

            Expanded(child: Container()),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],

                    ),
                    child: Icon(Icons.volume_up, color: Colors.white, size: 40,)),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),


                      ),
                      child: Icon(Icons.call_end, color: Colors.white, size: 40,)),
                ),
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],

                    ),
                    child: Icon(Icons.mic, color: Colors.white, size: 40,)),
              ],
            )

          ],
        ),
      ),
    );
  }


}
