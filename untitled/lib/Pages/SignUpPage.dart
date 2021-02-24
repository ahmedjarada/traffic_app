import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/http/requests.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  String genderValue;

  get onChangedGenderVal => genderValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
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
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(60.0, 60.0, 0.0, 0.0),
                              child: Text(
                                '.',
                                style: TextStyle(
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              ),
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
                                controller: emailController,
                                decoration: InputDecoration(
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    // hintText: 'EMAIL',
                                    // hintStyle: ,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber))),
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: passwordController,
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
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: userNameController,
                                decoration: InputDecoration(
                                    labelText: 'USERNAME',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber))),
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: firstNameController,
                                decoration: InputDecoration(
                                    labelText: 'FIRST NAME',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber))),
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: lastNameController,
                                decoration: InputDecoration(
                                    labelText: 'LAST NAME',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.amber))),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  children: [
                                    Text(
                                      "GENDER: ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: DropdownButton(
                                          items: [
                                            DropdownMenuItem(
                                                child: Text(
                                                  "Male",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Montserrat'),
                                                ),
                                                value: "M"),
                                            DropdownMenuItem(
                                                child: Text(
                                                  "Female",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Montserrat'),
                                                ),
                                                value: "F")
                                          ],
                                          value: genderValue,
                                          hint: Text("-"),
                                          onChanged: (value) {
                                            setState(() {
                                              genderValue = value;
                                              print(value);
                                            });
                                          }),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 50.0),
                              Container(
                                height: 40.0,
                                child: RaisedButton(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 120),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: Colors.amber,
                                  child: Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  onPressed: () async {
                                    var response = await new Request().signUp({
                                      'email': emailController.text,
                                      'username': userNameController.text,
                                      'password': passwordController.text,
                                      'first_name': firstNameController.text,
                                      'last_name': firstNameController.text,
                                      'gender': genderValue,
                                    });
                                    await Future.delayed(
                                        Duration(milliseconds: 50));
                                    if (response != null) {
                                      if (response["status"] == true) {
                                        showDialog(
                                            context: context,
                                            builder: (_) => new AlertDialog(
                                                  content: new Text(
                                                      "${response["msg"]}"),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text('Verify'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pushNamed('verify');
                                                      },
                                                    )
                                                  ],
                                                ));
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (_) => new AlertDialog(
                                              content: new Text(
                                                  "${response["msg"]}"),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('Close'),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                )
                                              ],
                                            ));
                                      }
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                color: Colors.transparent,
                                child: Container(
                                  width: 300.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                      color: Colors.transparent,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed('login');
                                    },
                                    child: Center(
                                      child: Text('Go Back',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat')),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                            ],
                          )),
                      // SizedBox(height: 15.0),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Text(
                      //       'New to Spotify?',
                      //       style: TextStyle(
                      //         fontFamily: 'Montserrat',
                      //       ),
                      //     ),
                      //     SizedBox(width: 5.0),
                      //     InkWell(
                      //       child: Text('Register',
                      //           style: TextStyle(
                      //               color: Colors.green,
                      //               fontFamily: 'Montserrat',
                      //               fontWeight: FontWeight.bold,
                      //               decoration: TextDecoration.underline)),
                      //     )
                      //   ],
                      // )
                    ]))));
  }
}
