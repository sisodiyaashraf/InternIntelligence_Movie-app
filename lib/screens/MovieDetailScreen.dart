
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/aladin.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.10),
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Nav.pop use for back to previous screen
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: Row(
                    children: [
                      Icon(Icons.turned_in_not_outlined, color: Colors.white),
                      SizedBox(width: 15),
                      Icon(Icons.share, color: Colors.white),
                    ],
                  ),
                ),
           ] ),

            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Disney's Aladdin",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "2019 • Adventure, Comedy • 2h 8m",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(170, 45),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.play_arrow),
                            SizedBox(width: 8),
                            Text('Play'),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(170, 45),
                          backgroundColor: Color.fromARGB(114, 67, 16, 18),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            
                            Icon(Icons.download),
                            SizedBox(width: 8),
                            Text('Download'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Aladdin, a street boy who falls in love with a princess. "
                    "With differences in caste and wealth, Aladdin tries to find a way to become a prince...",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 16),

                  
                  
                   DefaultTabController(
      initialIndex: 1,
      length: 3,
     
       child:TabBar(tabs: [
        Tab(text: 'Episode',),
        Tab(text: 'Similiar',),
        Tab(text: 'About',),
       ]), 
                  ),
                 
                Column(
                  
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      
                      margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                                height: 135,
                                
                                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 34, 38, 40),borderRadius: BorderRadius.circular(20)),
                    child:Row(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 140,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          image: DecorationImage(
            image: AssetImage('assets/images/aladin.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
 
    Expanded(
      child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Row(
      mainAxisSize: MainAxisSize.min, 
      children: [
        Text(
          "Trailer",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        SizedBox(width: 90), 
        Icon(Icons.download_rounded, color: Colors.white),
      ],
    ),
  

          
          Text(
            "Aladdin, a street boy who falls in love with a princess With differences in caste and wealth, Aladdin tries to find...",
                    
            style: TextStyle(color: Colors.grey),
          ),
         
        ],
      ),
    ),
  ],
)

                              ),
                  ),
                              
                ],
              )]
          ),
        )],
              ),
          )
          
        );
    
    
  }
}
    