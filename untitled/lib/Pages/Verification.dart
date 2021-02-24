import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/http/requests.dart';

class ConfirmVerificationCode extends StatefulWidget {
  @override
  _ConfirmVerificationCodeState createState() =>
      _ConfirmVerificationCodeState();
}

class _ConfirmVerificationCodeState extends State<ConfirmVerificationCode> {
  final digitOneController = TextEditingController();
  final digitTwoController = TextEditingController();
  final digitThreeController = TextEditingController();
  final digitFourController = TextEditingController();
  SharedPreferences preferences;
  FocusNode digitOne;
  FocusNode digitTwo;
  FocusNode digitThree;
  FocusNode digitFour;

  void requestVerification() async {
    await Request().requestVerificationCode();
  }

  @override
  void initState() {
    // TODO: implement initState
    requestVerification();
    super.initState();
    digitOne = FocusNode();
    digitTwo = FocusNode();
    digitThree = FocusNode();
    digitFour = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    digitOneController.dispose();
    digitTwoController.dispose();
    digitThreeController.dispose();
    digitFourController.dispose();
    digitOne.dispose();
    digitTwo.dispose();
    digitThree.dispose();
    digitFour.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.vertical,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.only(left: 10.0, top: 50.0),
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Text('Verify your account',
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                  'Check your email, we sent a verification code.',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w100)),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                  'Maybe see the message in Junk or Spam folder',
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w100)),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            children: [
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 3.0),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: TextField(
                                        focusNode: digitOne,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        showCursor: false,
                                        minLines: 1,
                                        maxLength: 1,
                                        maxLines: 1,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                            counterText: "",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w200,
                                                color: Colors.grey),
                                            focusedBorder: null),
                                        obscureText: false,
                                        controller: digitOneController,
                                        onEditingComplete: () =>
                                            node.nextFocus(),
                                        onChanged: (value) {
                                          if (digitOneController
                                              .text.isNotEmpty) {
                                            digitTwo.requestFocus();
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: TextField(
                                        focusNode: digitTwo,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        showCursor: false,
                                        minLines: 1,
                                        maxLength: 1,
                                        maxLines: 1,
                                        autocorrect: false,
                                        obscureText: false,
                                        controller: digitTwoController,
                                        decoration: InputDecoration(
                                            counterText: "",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w200,
                                                color: Colors.grey),
                                            focusedBorder: null),
                                        onEditingComplete: () =>
                                            node.nextFocus(),
                                        onChanged: (value) {
                                          if (digitTwoController
                                              .text.isNotEmpty) {
                                            digitThree.requestFocus();
                                          }
                                          if (digitTwoController.text.isEmpty) {
                                            digitOne.requestFocus();
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: TextField(
                                        focusNode: digitThree,
                                        textAlign: TextAlign.center,
                                        showCursor: false,
                                        keyboardType: TextInputType.number,
                                        minLines: 1,
                                        maxLength: 1,
                                        maxLines: 1,
                                        autocorrect: false,
                                        obscureText: false,
                                        controller: digitThreeController,
                                        decoration: InputDecoration(
                                            counterText: "",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w200,
                                                color: Colors.grey),
                                            focusedBorder: null),
                                        onEditingComplete: () =>
                                            node.nextFocus(),
                                        onChanged: (value) {
                                          if (digitThreeController
                                              .text.isNotEmpty) {
                                            digitFour.requestFocus();
                                          }
                                          if (digitThreeController
                                              .text.isEmpty) {
                                            digitTwo.requestFocus();
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: TextField(
                                        focusNode: digitFour,
                                        textAlign: TextAlign.center,
                                        showCursor: false,
                                        keyboardType: TextInputType.number,
                                        minLines: 1,
                                        maxLength: 1,
                                        maxLines: 1,
                                        autocorrect: false,
                                        obscureText: false,
                                        controller: digitFourController,
                                        decoration: InputDecoration(
                                            counterText: "",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w200,
                                                color: Colors.grey),
                                            focusedBorder: null),
                                        onEditingComplete: () =>
                                            node.nextFocus(),
                                        onChanged: (value) {
                                          if (digitFourController
                                              .text.isNotEmpty) {
                                            node.nextFocus();
                                          }
                                          if (digitFourController
                                              .text.isEmpty) {
                                            digitThree.requestFocus();
                                          }
                                        },
                                      ),
                                    ),
                                  ]),
                              SizedBox(height: 50.0),
                              Center(
                                child: RaisedButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 100),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    color: Colors.amber,
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                    onPressed: () async {
                                      final pin =
                                          "${digitOneController.text}${digitTwoController.text}${digitThreeController.text}${digitFourController.text}";
                                      print(pin);
                                      final response =
                                          await Request().verify(pin);
                                      if (response != null) {
                                        if (response['status']) {
                                          await showDialog(
                                              context: context,
                                              builder: (_) => new AlertDialog(
                                                    content: new Container(
                                                      width: 30.0,
                                                      height: 39,
                                                      child: Text(
                                                          "${response['msg']}"),
                                                    ),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text('finish'),
                                                        onPressed: () async {
                                                          preferences =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          if (preferences.getBool(
                                                              "isVerification")) {
                                                            Navigator.of(
                                                                    context)
                                                                .pushNamed(
                                                                    'home');
                                                          } else {
                                                            Navigator.of(
                                                                    context)
                                                                .pushNamed(
                                                                    'home');
                                                          }
                                                        },
                                                      )
                                                    ],
                                                  ));
                                        } else {
                                          await showDialog(
                                              context: context,
                                              builder: (_) => new AlertDialog(
                                                    content: new Container(
                                                      width: 30.0,
                                                      height: 39,
                                                      child: Text(
                                                          "${response['msg']}"),
                                                    ),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text('close'),
                                                        onPressed: () async {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      )
                                                    ],
                                                  ));
                                        }
                                      }
                                    }),
                              ),
                            ],
                          ))
                    ])))));
  }
}
