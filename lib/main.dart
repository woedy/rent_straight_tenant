import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_straight_tenent/Auth/Password/forgot_password.dart';
import 'package:rent_straight_tenent/Auth/Password/verify_reset_token.dart';
import 'package:rent_straight_tenent/Auth/SignIn/sign_in_screen.dart';
import 'package:rent_straight_tenent/Auth/SignUp/email_verification.dart';
import 'package:rent_straight_tenent/Auth/SignUp/password.dart';
import 'package:rent_straight_tenent/Auth/SignUp/sign_up_screen.dart';
import 'package:rent_straight_tenent/Auth/SignUp/upload_card.dart';
import 'package:rent_straight_tenent/ChatScreen/chat_message_screen.dart';
import 'package:rent_straight_tenent/ChatScreen/chat_screen.dart';
import 'package:rent_straight_tenent/Favorite/favorite_screen.dart';
import 'package:rent_straight_tenent/HomeScreen/home_screen.dart';
import 'package:rent_straight_tenent/HouseInner/house_inner_1.dart';
import 'package:rent_straight_tenent/HouseInner/house_inner_apply.dart';
import 'package:rent_straight_tenent/Landloard/landloard.dart';
import 'package:rent_straight_tenent/ProfileScreen/UserProfileScreen.dart';
import 'package:rent_straight_tenent/ProfileScreen/edit_profile.dart';
import 'package:rent_straight_tenent/Settings/settings_screen.dart';
import 'package:rent_straight_tenent/SplashScreen/splash_screen.dart';
import 'package:rent_straight_tenent/theme.dart';

import 'Auth/SignUp/upload_photo.dart';
import 'Landloard/call_landloard.dart';
import 'constants.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => {runApp(MyApp())});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Hide the keyboard when tapping outside the text field
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rent Straight-Tenant',
        theme: theme(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? api_key = "";
  Future? _user_api;

  @override
  void initState() {
    super.initState();
    _user_api = apiKey();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _user_api,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          return api_key == null ? SplashScreen() : HomeScreen();
          //return VerifyResetToken(email: "ximod71716@funvane.com",);
          //return ForgotPasswordScreen();

        });
  }


  Future apiKey() async {
    api_key = await getApiPref();
  }
}
