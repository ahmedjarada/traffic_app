import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pushNamed('/map'),
        ),
        title: Text("About us"),
      ),
      body: Container(
        child: Center(child: Text("Hello world!")),
      ),
    );
  }
}
