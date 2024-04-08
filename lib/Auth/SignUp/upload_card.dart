import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_straight_tenent/Auth/SignUp/email_verification.dart';
import 'package:rent_straight_tenent/Auth/SignUp/password.dart';
import 'package:rent_straight_tenent/Components/keyboard_utils.dart';
import 'package:rent_straight_tenent/Components/photos/select_photo_options_screen.dart';
import 'package:rent_straight_tenent/HomeScreen/home_screen.dart';
import 'package:rent_straight_tenent/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class UploadCard extends StatefulWidget {
  final full_name;
  final username;
  final email;
  final contact_number;
  const UploadCard({
    super.key,
    required this.full_name,
    required this.username,
    required this.email,
    required this.contact_number,
  });

  @override
  State<UploadCard> createState() => _UploadCardState();
}

class _UploadCardState extends State<UploadCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final _formKey = GlobalKey<FormState>();

  FocusNode focusNode = FocusNode();
  File? _image;
  String? selectedCard;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Image.asset("assets/images/rent_logo.png"),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mr.Fred Fafa, ",
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily: "MontserratAlternates",
                              fontWeight: FontWeight.w500,
                              height: 1.2),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Prove your existence",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "MontserratAlternates",
                                fontWeight: FontWeight.w500,
                                height: 1.1)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.1))),
                        child: GestureDetector(
                          onTap: () {
                            _showCardTypeSelectionModal(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.1))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedCard ?? 'Card type',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Form(
                                  //key: _formKey,
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 250,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.1))),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Stack(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      _showSelectPhotoOptions(
                                                          context);
                                                    },
                                                    child: _image == null
                                                        ? Center(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .camera_alt_outlined,
                                                                  size: 50,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                SizedBox(
                                                                    height: 20),
                                                                Text(
                                                                  "Tap to upload your preferred profile picture",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                                SizedBox(
                                                                    height: 20),
                                                                /*   Text(
                                                  "(Optional)",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(color: Colors.grey),
                                                ),*/
                                                              ],
                                                            ),
                                                          )
                                                        : Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 300,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                image: DecorationImage(
                                                                    image: FileImage(
                                                                        _image!)))),
                                                  ),
                                                  if (_image != null)
                                                    Positioned(
                                                      bottom: 10,
                                                      right: 10,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            _image = null;
                                                          });
                                                        },
                                                        child: Icon(
                                                            Icons
                                                                .delete_forever,
                                                            color:
                                                                Colors.white),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape: CircleBorder(),
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          backgroundColor: Colors
                                                              .red, // Set the background color directly using backgroundColor
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            if (_image == null) ...[
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PasswordScreen(
                                                  full_name: widget.full_name,
                                                  username: widget.username,
                                                  email: widget.email,
                                                  contact_number:
                                                      widget.contact_number,
                                                )));

                                    /*             _showLoadingDialogModal(context);

                                        Timer(
                                            Duration(seconds: 4),
                                                () {
                                              Navigator.of(context).pop();
                                              _showSuccessDialogModal(context);

                                              Timer(
                                                  Duration(seconds: 2),
                                                      () {
                                                        Navigator.pushReplacement(context,
                                                            MaterialPageRoute(builder: (context) => HomeScreen())
                                                        );

                                                      }
                                              );
                                            }
                                        );



*/
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    //margin: EdgeInsets.all(10),
                                    height: 59,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: rentPrimary,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text(
                                        "Skip",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ] else ...[
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PasswordScreen(
                                                  full_name: widget.full_name,
                                                  username: widget.username,
                                                  email: widget.email,
                                                  contact_number:
                                                      widget.contact_number,
                                                )));

                                    /*     _showLoadingDialogModal(context);

                                        Timer(
                                            Duration(seconds: 4),
                                                () {
                                              Navigator.of(context).pop();
                                              _showSuccessDialogModal(context);
                                            }
                                        );*/
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    //margin: EdgeInsets.all(10),
                                    height: 59,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: rentPrimary,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  void _showCardTypeSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Ghana Card'),
                onTap: () {
                  setState(() {
                    selectedCard = 'Ghana Card';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('National Health Insurance'),
                onTap: () {
                  setState(() {
                    selectedCard = 'National Health Insurance';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Voters ID'),
                onTap: () {
                  setState(() {
                    selectedCard = 'Voters ID';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSuccessDialogModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/sprinkles.png"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/rent_logo.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "RentStraight",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          height: 1.2),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome to RentStraight",
                  style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w500, height: 1.2),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Elevate your ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.2),
                    ),
                    Text(
                      "experience",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          color: rentPrimary),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.green,
                      size: 55,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLoadingDialogModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/rent_logo.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "RentStraight",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          height: 1.2),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "is setting up your account",
                  style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w400, height: 1.2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RotationTransition(
                      turns: _controller,
                      child: Image.asset(
                        "assets/icons/loading.png",
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
