import 'package:cab_rider/brand_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Sign In As a Rider",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
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
                      TextField(
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
                      RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        color: BrandColors.colorGreen,
                        textColor: Colors.white,
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 18, fontFamily: 'Brand-Bold'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Don\'t have an account, sign up here"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
