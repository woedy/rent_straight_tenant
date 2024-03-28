import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_straight_tenent/Auth/SignIn/sign_in_screen.dart';
import 'package:rent_straight_tenent/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: rentLightblue
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Image.asset("assets/images/rent_logo.png"),
                ),
                Image.asset("assets/images/splash-house.png"),
              ],
            ),
            Container(


              child: Column(
                children: [
                  Expanded(flex:5,
                      child: Container()),
                  Expanded(
                    flex: 7,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: [
                              Color(0x2fffffff),
                              Colors.white],
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text("Elevate Your Experience", style: TextStyle(fontSize: 64, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500),),
                                  Text("Where Convenience Meets Comfort.", style: TextStyle(fontSize: 20),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            InkWell(
                              onTap: () {

                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));

                              },
                              child: Container(
                                padding: EdgeInsets.all(20),

                                decoration: BoxDecoration(
                                    color: rentPrimary,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Text(
                                    "Get Started",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
