import 'package:flutter/material.dart';
import 'package:movie_app/bottomnavbar/download_page.dart';
import 'package:movie_app/bottomnavbar/home_page.dart';
import 'package:movie_app/bottomnavbar/profile.dart';
import 'package:movie_app/bottomnavbar/saved_page.dart';
import 'package:movie_app/bottomnavbar/search_page.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int myCurrentIndex = 0;
  
  // Pass a function to handle search input
  void _handleSearch(String query) {
    print("Searching for: $query");
    // Add logic to filter movies based on search query
  }

  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(),
      SearchPage(onSearch: _handleSearch), // ✅ Fixed: Passed the required parameter
      SavedPage(),
      DownloadPage(),
      Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 40, 45, 79),
        elevation: 0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            myCurrentIndex = index;
          });
        },
        currentIndex: myCurrentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.turned_in_not_outlined), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Download'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ME'),
        ],
      ),
      body: pages[myCurrentIndex],
    );
  }
}
