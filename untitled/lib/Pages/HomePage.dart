import 'package:flutter/material.dart';
import 'package:untitled/Pages/HistoryPage.dart';
import 'package:untitled/Pages/HomeView.dart';
import 'package:untitled/Pages/ProfilePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  List<Widget> pages = [HomeView(),HistoryPage(),ProfilePage()];

  void onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  int selectedIndex =0;
  void onTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child:
      PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),),
      drawerScrimColor: Colors.amber,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        onTap: onTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded, color: selectedIndex==0? Colors.amber:Colors.grey,), title: Text("Home", style: TextStyle(color: Colors.grey),)),
          // BottomNavigationBarItem(icon: Icon(Icons.location_on, color: selectedIndex==1? Colors.amber:Colors.grey,), title: Text("Street", style: TextStyle(color: Colors.grey),)),
          BottomNavigationBarItem(icon: Icon(Icons.history_sharp, color: selectedIndex==1? Colors.amber:Colors.grey,), title: Text( "History", style: TextStyle(color: Colors.grey)),),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: selectedIndex==2? Colors.amber:Colors.grey,), title: Text("Profile", style: TextStyle(color: Colors.grey)) ,)
        ],
      ),
    );

  }


}
