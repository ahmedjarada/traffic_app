import 'package:flutter/material.dart';
import 'package:untitled/Pages/ChangePassword.dart';
import 'package:untitled/Pages/HomePage.dart';
import 'package:untitled/Pages/LoadingPage.dart';
// import 'package:untitled/Pages/MapPage.dart';
import 'package:untitled/Pages/HistoryPage.dart';
import 'package:untitled/Pages/AboutPage.dart';
import 'package:untitled/Pages/SignUpPage.dart';
import 'package:untitled/Pages/LoginPage.dart';
import 'package:untitled/Pages/ResetPassword.dart';
import 'package:untitled/Pages/SettingsPage.dart';
import 'package:untitled/Pages/ProfilePage.dart';

import 'Pages/Verification.dart';
import 'Pages/confirmReset.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      color: Colors.amber,
      title: 'Traffic App',

      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        'signup': (context) => SignupPage(),
        'login': (context) => LoginPage(),
        // 'map': (context) => MapPage(),
        'change': (context) => ChangePassword(),
        'verify': (context) => ConfirmVerificationCode(),
        'confirmReset':(context) => ConfirmResetCode(),
        'history': (context) => HistoryPage(),
        'reset': (context) => ResetPassword(),
        'profile': (context) => ProfilePage(),
        'home': (context) => HomePage(),

      },
      theme: ThemeData(accentColor: Colors.amber,

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
      ),

    );
  }
}

