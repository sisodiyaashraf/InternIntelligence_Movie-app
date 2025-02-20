import 'package:flutter/material.dart';
import 'package:movie_app/bottomnavbar/download_page.dart';
import 'package:movie_app/bottomnavbar/home_page.dart';
import 'package:movie_app/bottomnavbar/profile.dart';
import 'package:movie_app/bottomnavbar/saved_page.dart';
import 'package:movie_app/bottomnavbar/search_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int myCurrentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  void _handleSearch(String query) {
    print("Searching for: $query");
  }

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(),
      SearchPage(onSearch: _handleSearch),
      SavedPage(),
      DownloadPage(),
      Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[myCurrentIndex], // Display selected page
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: myCurrentIndex,
            height: 65.0,
            items: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home, size: 30, color: Colors.white),
                  Text("Home", style: TextStyle(fontSize: 12, color: Colors.white)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 30, color: Colors.white),
                  Text("Search", style: TextStyle(fontSize: 12, color: Colors.white)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.turned_in_not_outlined, size: 30, color: Colors.white),
                  Text("Saved", style: TextStyle(fontSize: 12, color: Colors.white)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.download, size: 30, color: Colors.white),
                  Text("Downloads", style: TextStyle(fontSize: 12, color: Colors.white)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 30, color: Colors.white),
                  Text("Profile", style: TextStyle(fontSize: 12, color: Colors.white)),
                ],
              ),
            ],
            color: Colors.black, 
            buttonBackgroundColor: Colors.grey[900]!, 
            backgroundColor: Colors.black, 
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            letIndexChange: (index) => true,
          ), 
        ],
      ),
    );
  }
}
