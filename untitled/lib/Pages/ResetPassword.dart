import 'package:flutter/material.dart';
import 'package:untitled/http/requests.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final emailController = TextEditingController();
  bool notEmptyEmail= false;
  bool isEmail = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(13.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Reset Password',
                        style: TextStyle(
                            fontSize: 45.0, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 180.0, 15.0, 0.0),
                      child: Text(
                        'You can reset your password by your email that was created your account.',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w200),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            errorText:notEmptyEmail? null: 'This field is required' ,
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber))),
                        controller: emailController,

                      ),
                      SizedBox(height: 60.0),
                      Container(
                        height: 40.0,
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(horizontal: 130),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.amber,
                          child: Text(
                            'RESET',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                          onPressed: () async {
                            setState(() {
                              emailController.text.isNotEmpty? notEmptyEmail = true: notEmptyEmail = false;
                              if(emailController.text.isNotEmpty){
                                emailController.text.contains('@')? isEmail = true: isEmail = false;
                              }
                            });
                            if(emailController.text.isNotEmpty) {
                              var response = await new Request()
                                  .reset({'email': emailController.text});
                              await Future.delayed(Duration(milliseconds: 50));
                              if (response != null) {
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                    new AlertDialog(
                                      content: new Text("${response['msg']}"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Next'),
                                          onPressed: () {
                                            Navigator.of(context).pushNamed('confirmReset');
                                          },
                                        )
                                      ],
                                    ));
                              }
                            }},
                        ),
                      ),
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
            ]));
  }
}
