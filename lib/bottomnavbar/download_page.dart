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
        backgroundColor: Colors.black, 
        appBar: AppBar(
          title: Text('Downloads', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black, 
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
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
              _movieItem("Captain America: The Winter Soldier", "Action, Adventure", "2:05:32 | 1.2GB", "assets/images/capt.jpg"),
              SizedBox(height: 10),
              _movieItem("Captain Marvel", "Action, Adventure", "2:05:32 | 1.2GB", "assets/images/capt wm.png"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _movieItem(String title, String genre, String details, String imagePath) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.grey[900], 
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
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
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Text(
                      genre,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Text(
                      details,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
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
    );
  }
}
