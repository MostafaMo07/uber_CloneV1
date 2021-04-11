import 'dart:io';
import 'package:cab_rider/screens/loginpage.dart';
import 'package:cab_rider/screens/mainpage.dart';
import 'package:cab_rider/screens/registrationpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'db2',
    options: Platform.isIOS
        ? FirebaseOptions(
            googleAppID: '',
            gcmSenderID: '',
            databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
          )
        : FirebaseOptions(
            googleAppID: '1:1032583614338:android:f8b5c1da766d58e585499b',
            apiKey: 'AIzaSyDMYl8v-SgS79xnLzbi4JqtDcnf4OMYfFo',
            databaseURL: 'https://geetcar-43694-default-rtdb.firebaseio.com',
          ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Brand-Regular',
          primarySwatch: Colors.blue,
        ),
        //home: RegistraionPage(),
        initialRoute: RegistraionPage.id,
        routes: {
          RegistraionPage.id: (context) => RegistraionPage(),
          LoginPage.id: (context) => LoginPage(),
          MainPage.id: (context) => MainPage()
        });
  }
}
