import 'package:flutter/material.dart';
import 'package:movie_app/bottomnavbar/search_page.dart';
import 'package:movie_app/screens/MovieDetailScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// Home Page with Carousel & Movie List
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **Carousel Section**
              const CarouselSlider(),

              const SizedBox(height: 20),

              /// **Categories Section**
              const Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  CategoryChip(label: "All",),
                  CategoryChip(label: "Action"),
                  CategoryChip(label: "Comedy"),
                  CategoryChip(label: "Romance"),
                ],
              ),

              const SizedBox(height: 20),

              /// **Most Popular Section**
              const Text(
                "Most Popular",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              MovieList(),

              const SizedBox(height: 20),

              /// **Latest Movies Section**
              const Text(
                "Latest Movies",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              MovieList(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Carousel Slider Component
class CarouselSlider extends StatefulWidget {
  const CarouselSlider({super.key});

  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentIndex = 0;

  final List<String> images = [
    "assets/images/aladin.png",
    "assets/images/capt wm.png",
    "assets/images/capt.jpg",
    "assets/images/captain fs.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: _currentIndex == index ? 0 : 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        SmoothPageIndicator(
          controller: _pageController,
          count: images.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: Colors.red,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );
  }
}

/// Category Chips Component
class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 6.75),
  child: Chip(
    label: Text(
      label,
      style: TextStyle(
        color: label == "All" ? Colors.white : Colors.black, // Text color
      ),
    ),
    backgroundColor: label == "All" ? Colors.red : Colors.white, // Red for "All", white for others
  ),
);
  }
}

/// Movie List Component
class MovieList extends StatelessWidget {
  final List<String> movieImages = [
    'assets/images/aladin.png',
    'assets/images/capt wm.png',
    'assets/images/capt.jpg',
    'assets/images/captain fs.png',
  ];

  MovieList({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return MovieCard(imagePath: movieImages[index]);
        },
      ),
    );
  }
}

/// Movie Card Component
class MovieCard extends StatelessWidget {
  final String imagePath; // Accepts image path dynamically

  const MovieCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MovieDetailScreen())),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath), // Dynamic image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/// Movie Detail Screen


class MovieSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Search Movies"),
      ),
      body: Column(
        children: [
          SearchPage(
            onSearch: (query) {
              print("Searching for: $query");
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                "Search results will appear here",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
