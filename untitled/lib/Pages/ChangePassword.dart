import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/http/requests.dart';

// ignore: must_be_immutable
class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final newPasswordController = TextEditingController();
  FocusNode newPassword;
  ScrollController _scroll;

  @override
  void initState() {
    // TODO: implement initState
    newPassword = new FocusNode();
    _scroll = new ScrollController();
    newPassword.addListener(() {
      _scroll.jumpTo(-1.0);
    });
    super.initState();
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
                              Text('Recovery your account',
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text('Enter new password and confirm',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w100)),

                            ],
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            children: [
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4.0),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: (MediaQuery.of(context).size.width/2.0),
                                      child: TextField(
                                        // autofocus: true,
                                        maxLines: 1,
                                        scrollController: _scroll,
                                        focusNode: newPassword,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        textAlign: TextAlign.left,
                                        decoration: InputDecoration(
                                            // labelText: 'PASSWORD',
                                            hintText: "Enter new password",
                                            counterText: "",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide:
                                                BorderSide(color: Colors.amber))),
                                        obscureText: true,
                                        controller: newPasswordController,
                                        onEditingComplete: () => node.nextFocus(),
                                        // onChanged: (value) {
                                        //   if (newPasswordController
                                        //       .text.isNotEmpty) {
                                        //     node.nextFocus();
                                        //   }
                                        // },
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
                                      if(newPasswordController.text.isNotEmpty){
                                        final password= newPasswordController.text;
                                        final response = await Request().resetPassword(password);
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
                                                      child: Text('Next'),
                                                      onPressed: () async {
                                                        Navigator.of(context)
                                                            .pushNamed(
                                                            'login');
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
                                                      child: Text('Close'),
                                                      onPressed: () async {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    )
                                                  ],
                                                ));
                                          }
                                      }

                                      }
                                    }),
                              ),
                            ],
                          ))
                    ])))));
  }
}
