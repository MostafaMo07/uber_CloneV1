import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(fontSize: 15.0),
                hintStyle: TextStyle(fontSize: 10, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
