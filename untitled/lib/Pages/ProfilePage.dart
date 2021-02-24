import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Pages/LoginPage.dart';
import 'package:untitled/Pages/SettingsPage.dart';
import 'package:untitled/http/requests.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Edit Profile",
      theme: ThemeData(
        accentColor: Colors.amber,

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
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Edit Profile"),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout,
              ),
              onPressed: () async {
                var response = await new Request().logout();
                await Future.delayed(Duration(milliseconds: 50));
                // print(response);
                if (response != null) {
                   await showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                            content: new Text("${response["msg"]}"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Close'),
                                onPressed: () async {
                                  Navigator.push(_, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));


                                },
                              )
                            ],
                          ));
                }
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          // reverse: true,
          scrollDirection: Axis.vertical,
          child: Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Column(
                children: [
                  buildTextField(
                      "Full Name", "Test Name", false, TextInputType.text),
                  buildTextField("E-mail", "Enter new email", false,
                      TextInputType.emailAddress),
                  buildTextField("Password", "Enter new password", true,
                      TextInputType.visiblePassword),
                  buildTextField(
                      "Location", "Enter new location", false, TextInputType.streetAddress),
                  SizedBox(
                    height: 60,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.amber,
                    padding: EdgeInsets.symmetric(horizontal: 130),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14, letterSpacing: 2, color: Colors.white),
                    ),
                  ),
                ],
              )),
        ));
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, TextInputType Field) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        keyboardType: Field,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            )),
      ),
    );
  }
}
