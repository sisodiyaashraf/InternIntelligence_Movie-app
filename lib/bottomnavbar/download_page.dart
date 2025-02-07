import 'package:flutter/material.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Download'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Downloaded'),
              Tab(text: 'Downloading'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // First Movie Container
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/capt.jpg',
          width: 130,
          height: 110,
          fit: BoxFit.cover,
        ),
      ),
    ),
    SizedBox(width: 10),
    Expanded(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Captain America: The Winter Soldier",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              Text(
                "Action, Adventure",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                "2:05:32 | 1.2GB",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          // Positioned more_vert icon at bottom-left
          Positioned(
            bottom: 100,
            left: 180,
            child: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
    ),
  ],
),

              ),

              SizedBox(height: 10),

              // Second Movie Container
             Container(
  margin: EdgeInsets.all(2),
  height: 130,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(20),
  ),
  child: Row(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/capt wm.png",
            width: 130,
            height: 110,
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Captain Marvel",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Text(
                  "Action, Adventure",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10),
                Text(
                  "2:05:32 | 1.2GB",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            // Positioned more_vert icon at bottom-left
            Positioned(
              bottom: 100,
              left: 180,
              child: Icon(Icons.more_vert, color: Colors.white),
            ),
          ],
        ),
      ),
    ],
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
