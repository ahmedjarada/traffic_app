import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/http/requests.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

        onWillPop: () async => false,
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                              child: Text('Hello there',
                                  style: TextStyle(
                                      fontSize: 60.0,
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(17.0, 170.0, 0.0, 0.0),
                              child: Text('let\'s sign in',
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w300)),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(171.0, 110.0, 0.0, 0.0),
                              child: Text('.',
                                  style: TextStyle(
                                      fontSize: 80.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber)),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(109.0, 110.0, 0.0, 0.0),
                              child: Text('.',
                                  style: TextStyle(
                                      fontSize: 80.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber)),
                            )
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              top: 35.0, left: 20.0, right: 20.0),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber))),
                                controller: emailController,
                              ),
                              SizedBox(height: 20.0),
                              TextField(
                                decoration: InputDecoration(
                                    labelText: 'PASSWORD',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber))),
                                obscureText: true,
                                controller: passwordController,
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                alignment: Alignment(1.0, 0.0),
                                padding: EdgeInsets.only(top: 15.0, left: 20.0),
                                child: InkWell(
                                  onTap: () => {
                                    Navigator.of(context).pushNamed('reset')
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat',
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                              SizedBox(height: 50.0),
                              Container(
                                height: 40.0,
                                child: RaisedButton(
                                  padding: EdgeInsets.symmetric(horizontal: 130),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: Colors.amber,
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  onPressed: () async {
                                  var response= await new Request().login({'email': emailController.text, 'password': passwordController.text});
                                  await Future.delayed(Duration(milliseconds: 50));
                                  // print(response);
                                  if(response != null){
                                    if(response['status']){
                                      await showDialog(

                                          context: context,
                                          builder: (_) => new AlertDialog(
                                            content: new Container(width: 30.0, height: 39,child:Column(children: [ Text("Hello, ${response['data']['first_name']}"),Text("${response['msg']}")],)),

                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text('Next'),
                                                onPressed: () async{
                                                  // preferences = await SharedPreferences.getInstance();
                                                  if(response['data']['is_verified']== true){
                                                    Navigator.of(context).pushNamed('home');
                                                  }else{
                                                    Navigator.of(context).pushNamed('verify');
                                                  }

                                                },
                                              )
                                            ],
                                          ));
                                    }else{
                                      await showDialog(

                                          context: context,
                                          builder: (_) => new AlertDialog(
                                            content: Text("${response['msg']}"),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text('Close'),
                                                onPressed: () async{
                                                  // preferences = await SharedPreferences.getInstance();
                                                  Navigator.of(context).pop();

                                                },
                                              )
                                            ],
                                          ));
                                    }

                                  }
                                  },
                                ),

                              ),
                              SizedBox(height: 30.0),
                            ],
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Not have an account ?',
                              style: TextStyle(fontFamily: 'Montserrat'),
                            ),
                            SizedBox(width: 5.0),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('signup');
                              },
                              child: Text(
                                'create account',
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ])
                    ]))));
  }
}
