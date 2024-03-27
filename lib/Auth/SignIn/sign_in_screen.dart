import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/Auth/SignUp/sign_up_screen.dart';
import 'package:rent_straight_tenent/Components/keyboard_utils.dart';
import 'package:rent_straight_tenent/HomeScreen/home_screen.dart';
import 'package:rent_straight_tenent/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  var show_password = false;

  //Future<SignInModel>? _futureSignIn;

  String? email;
  String? password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: rentGray
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(height: 570,
                      "assets/images/rent-elipse.png"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Image.asset("assets/images/rent_logo.png"),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text("Elevate Your", style: TextStyle(fontSize: 64, fontFamily: "MontserratAlternates", fontWeight: FontWeight.w500, height: 1.2),),
                        Text("Experience", style: TextStyle(fontSize: 64, fontFamily: "MontserratAlternates",  fontWeight: FontWeight.w500, color: rentPrimary, height: 1.1)),
                      ],
                    ),
                  ),


                  Expanded(
                      child: ListView(
                        children: [
                          Container(
                            child: Column(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children: [

                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.black.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors.white.withOpacity(0.4))),
                                              child: TextFormField(
                                                style: TextStyle(color: Colors.white),
                                                decoration: InputDecoration(
                                                  //hintText: 'Enter Username/Email',

                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.normal),
                                                  labelText: "Email",
                                                  labelStyle: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white),
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
                                                    email = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.black.withOpacity(0.2),
                                                  borderRadius: BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors.white.withOpacity(0.4))),
                                              child: TextFormField(
                                                style: TextStyle(color: Colors.white),
                                                decoration: InputDecoration(
                                                  suffixIcon: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        show_password = !show_password;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      show_password
                                                          ? Icons.remove_red_eye_outlined
                                                          : Icons.remove_red_eye,
                                                      color: Colors.white,
                                                    ),
                                                  ),

                                                  hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.normal),
                                                  labelText: "Password",
                                                  labelStyle: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white),
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
                                                    return 'Password is required';
                                                  }
                                                  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#\$%^&*_()\-+=/.,<>?"~`£{}|:;])')
                                                      .hasMatch(value)) {

                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text("- Password must be at least 8 characters long\n- Must include at least one uppercase letter,\n- One lowercase letter, one digit,\n- And one special character",),
                                                        backgroundColor: Colors.red,
                                                      ),
                                                    );
                                                    return '';
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  setState(() {
                                                    password = value;
                                                  });
                                                },
                                                textInputAction: TextInputAction.next,
                                                obscureText: show_password ? false : true,
                                                onSaved: (value) {
                                                  setState(() {
                                                    password = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
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
                                                "Sign In",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: (){
                                          //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ForgotPassword()));

                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Forgot password? ", style: TextStyle(fontSize: 12),),
                                              Text("Click here to recover", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: rentPrimary),),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 1,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black.withOpacity(0.3)),
                                                ),
                                              ),


                                              Text("Or ", style: TextStyle(fontSize: 12),),


                                              Expanded(
                                                child: Container(
                                                  height: 1,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black.withOpacity(0.3)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),


                                        SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUpScreen()));
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Don't have an account? ",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                "Sign up here",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600, color: rentPrimary),
                                              ),
                                            ],
                                          ),
                                        )


                                      ],
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ],
                      )
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
