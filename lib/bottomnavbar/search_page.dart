import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Function(String) onSearch;

  const SearchPage({Key? key, required this.onSearch}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 70),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900], // Dark background
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          controller: _searchController,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.red, // Red cursor
          decoration: InputDecoration(
            hintText: "Search movies...",
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white), // Search icon
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.white), // Clear button
                    onPressed: () {
                      _searchController.clear();
                      widget.onSearch(""); // Clear search results
                      setState(() {}); // Refresh UI
                    },
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
          onChanged: (value) {
            widget.onSearch(value); // Pass search text to parent widget
            setState(() {}); // Refresh UI for suffix icon
          },
        ),
      ),
    );
  }
}
