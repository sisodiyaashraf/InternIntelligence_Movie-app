import 'package:flutter/material.dart';
import 'package:movie_app/bottomnavbar/home_page.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final List<Map<String, String>> savedMovies = [
    {
      'title': 'Aladdin',
      'genre': 'Fantasy, Adventure',
      'duration': '2:30:52 | 2.2GB',
      'image': 'assets/images/aladin.png',
    },
    {
      'title': 'Captain America',
      'genre': 'Action, Adventure',
      'duration': '2:55:32 | 1.5GB',
      'image': 'assets/images/captain fs.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Watch Later',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: savedMovies.map((movie) {
            return Container(
              width: double.infinity,
              height: 130,
              margin: EdgeInsets.symmetric(vertical: 5),
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
                        movie['image']!,
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
                              movie['title']!,
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            Text(
                              movie['genre']!,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 10),
                            Text(
                              movie['duration']!,
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
          }).toList(),
        ),
      ),
    );
  }
}
