import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/SharedPreference/Preference.dart';

import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  SharedPreferences preferences;

  Future<String> getUserInfo() async {
    preferences = await SharedPreferences.getInstance();
    var email = preferences.containsKey("email");
    var pass = preferences.containsKey("secretKeyP");
    var btoken = preferences.containsKey("AuthBToken");
    // var isOpened=  preferences.containsKey("is_opened");
    // var verification= preferences.containsKey("verification");
    // if (!isOpened){
    //   preferences.setString("is_opened", "False");
    // }
    // if (!verification){
    //   preferences.setString("verification", "False");
    // }
    if (email && pass) {
      if (btoken) {
        print("state -- 1");
        return "true";
      } if (!btoken) {
        print("state -- 2");
        return "false";
      }
    } if(!email && !pass) {
      print("state -- 2");
      return "false";
    }
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);

    // switch
    // if (result["isLogin"] && result["isSignup"]){
    //   Navigator.of(context).pushNamed('/home');
    // }else if(result["isLogin"] && result["isSignup"])
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      var result = await getUserInfo();
      // print(result);
      // if(result== "true")Navigator.of(context).pushNamed('home');
      // else if(result== "false") Navigator.of(context).pushNamed('login');

      switch(result){
        case "true":
          Navigator.of(context).pushNamed('home');
          break;
        case "false":
          Navigator.of(context).pushNamed('login');
          break;
        default:
          Navigator.of(context).pushNamed('login');
          break;
      }

      // switch(result) {
      //   case 0: {  }
      //   break;
      //
      //   case 1: {   }
      //   break;
      //
      //   case 2: {  Navigator.of(context).pushNamed('login'); }
      //   break;
      //
      //
      //
      //
      // }
    });
    // Timer(Duration(seconds: 2), ()=> {Navigator.of(context).pushNamed('/login')});
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.amber),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Icon(
                        Icons.traffic,
                        color: Colors.amber,
                        size: 100,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
