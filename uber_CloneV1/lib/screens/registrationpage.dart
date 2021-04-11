import 'dart:core';

import 'package:cab_rider/screens/mainpage.dart';
import 'package:cab_rider/widgets/ProgressDialog.dart';
import 'package:cab_rider/widgets/TaxiButton.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../brand_colors.dart';
import 'loginpage.dart';

class RegistraionPage extends StatefulWidget {
  static const String id = 'register';

  @override
  _RegistraionPageState createState() => _RegistraionPageState();
}

class _RegistraionPageState extends State<RegistraionPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnackBar(String title) {
    final snackbar = SnackBar(
        content: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ));
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var fullNameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  void registerUser() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressDialog(
              status: "Registering You...",
            ));
    final FirebaseUser user = (await _auth
            .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
            .catchError((ex) {
      //check error and display message
      Navigator.pop(context);
      PlatformException thisEx = ex;
      showSnackBar(thisEx.message);
    }))
        .user;

    //check if user registraion is successful
    if (user != null) {
      DatabaseReference newUserRef =
          FirebaseDatabase.instance.reference().child("users/${user.uid}");

      Map userMap = {
        'fullname': fullNameController.text,
        'email': emailController.text,
        'phone': phoneController.text
      };

      newUserRef.set(userMap);
      //Take user to mainPage
      Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Image(
                  image: AssetImage('images/logo.png'),
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Create a Rider's Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //Full Name
                      TextField(
                        controller: fullNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: TextStyle(fontSize: 15.0),
                            hintStyle:
                                TextStyle(fontSize: 10, color: Colors.grey)),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Email Address
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(fontSize: 15.0),
                            hintStyle:
                                TextStyle(fontSize: 10, color: Colors.grey)),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Phone
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(fontSize: 15.0),
                            hintStyle:
                                TextStyle(fontSize: 10, color: Colors.grey)),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Password
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(fontSize: 15.0),
                            hintStyle:
                                TextStyle(fontSize: 10, color: Colors.grey)),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TaxiButton(
                        title: 'REGISTER',
                        color: BrandColors.colorAccentPurple,
                        onPressed: () async {
                          //check network connectivity
                          var connectivityResult =
                              await Connectivity().checkConnectivity();
                          if (connectivityResult != ConnectivityResult.mobile &&
                              connectivityResult != ConnectivityResult.wifi) {
                            showSnackBar("Noe Internet Connection");
                            return;
                          }

                          if (fullNameController.text.length < 3) {
                            showSnackBar('Please Provide a valid Full Name');
                            return;
                          }
                          if (phoneController.text.length < 10) {
                            showSnackBar('Please Provide a valid Phone Number');
                            return;
                          }
                          if (!emailController.text.contains('@')) {
                            showSnackBar(
                                'Please Provide a valid Email Address');
                            return;
                          }

                          if (passwordController.text.length < 8) {
                            showSnackBar(
                                'Password Must be at least 8 chracters');
                            return;
                          }

                          registerUser();
                        },
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginPage.id, (route) => false);
                  },
                  child: Text("Already have a Rider Account? Log In"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
