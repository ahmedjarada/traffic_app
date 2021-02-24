import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  Future<Null> _refresh() {}
      @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);

  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("History"),

        ),
        body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refresh,
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.history_sharp),
                      SizedBox(height: 24.0),
                    ],
                  ),
                ),
              )
            ])));
  }
}
