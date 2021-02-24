import 'package:flutter/material.dart';

// import 'package:flutter/rendering.dart';
import 'package:untitled/http/requests.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'LoginPage.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
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
                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                                    Navigator.of(context).pushNamed('login');
                                    // Navigator.pop(context);
                                  },
                                )
                              ],
                            ));
                  }
                })
          ],
          title: Text("Home"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          // color: Colors.grey[100],
          child: new Center(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              primary: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              // padding: EdgeInsets.all(10.0),
              children: [
                Container(
                    margin: EdgeInsets.only(
                        right: 10.0, left: 10.0, top: 10.0, bottom: 5.0),
                    child: chartMaterial(
                        "Traffic Jam", "+45%", "Al-Nasser St.", [
                      0.5,
                      1.1,
                      1.5,
                      2.0,
                      0.1,
                      1.0,
                      -0.5,
                      -1.0,
                      -0.5,
                      0.3,
                      0.6
                    ])),
                Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        statisticsMaterial("Traffic Analysis", "33%",
                            "Al-Nasser St.", "Last Hour"),
                        statisticsMaterial("Traffic Analysis", "10%",
                            "Al-Nasser St.", "Last Two Hours")
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.baseline,

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              constraints: constraints,
                              // width: constraints.maxWidth - 10.0,
                              child: statisticsMaterial("Traffic Analysis",
                                  "12%", "Al-Nasser St.", "Last Night"),
                            );
                          },
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              constraints: constraints,
                              child: statisticsMaterial("Traffic Analysis",
                                  "12%", "Al-Nasser St.", "Last Night"),
                            );
                          },
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(
                        right: 10.0, left: 10.0, top: 5.0, bottom: 5.0),
                    child: chartMaterial(
                        "Traffic Jam", "+21%", "Al-Sheifa St.", [
                      0.1,
                      0.0,
                      1.5,
                      1.0,
                      1.1,
                      1.0,
                      -0.3,
                      -1.1,
                      -0.6,
                      1.3,
                      0.5
                    ])),
                Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            statisticsMaterial("Traffic Analysis", "12%",
                                "Al-Sheifa St.", "Last Hour"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            statisticsMaterial("Traffic Analysis", "7%",
                                "Al-Sheifa St.", "Last Two Hours")
                          ],
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            statisticsMaterial("Traffic Analysis", "5%",
                                "Al-Sheifa St.", "Last Night"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            statisticsMaterial("Traffic Analysis", "4%",
                                "Al-Sheifa St.", "Last Day")
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}

Material chartMaterial(String title, String percent, String subtitle, data) {
  return Material(
    color: Colors.white,
    elevation: 3.0,
    borderRadius: BorderRadius.circular(10.0),
    shadowColor: Colors.grey[500],
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    percent,
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: new Sparkline(
                    data: data,
                    fillMode: FillMode.below,
                    lineColor: Colors.grey[800],
                    fillColor: Colors.amber[200],
                    pointsMode: PointsMode.all,
                    pointSize: 5.0,
                    pointColor: Colors.amber[800],
                    fillGradient: new LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.amber[800], Colors.amber[200]],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Material statisticsMaterial(
    String title, String percent, String subtitle, String duration) {
  return Material(
    color: Colors.white,
    elevation: 3.0,
    borderRadius: BorderRadius.circular(10.0),
    shadowColor: Colors.grey[500],
    child: Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5.0, right: 30.0, bottom: 5.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    duration,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    percent,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
// Material locationMaterial(
//     String title, String percent) {
//   return Material(
//     color: Colors.white,
//     elevation: 3.0,
//     borderRadius: BorderRadius.circular(10.0),
//     shadowColor: Colors.grey[500],
//     child: Container(
//       child: Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Row(
//           children: <Widget>[
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top: 5.0, right: 25.0, bottom: 5.0),
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.grey[800],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(1.0),
//                   child: Text(
//                     duration,
//                     style: TextStyle(
//                       fontSize: 12.0,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(1.0),
//                   child: Text(
//                     percent,
//                     style: TextStyle(
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(1.0),
//                   child: Text(
//                     subtitle,
//                     style: TextStyle(
//                       fontSize: 13.0,
//                       color: Colors.blueGrey,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
