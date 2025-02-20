import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Function(String) onSearch;

  const SearchPage({Key? key, required this.onSearch}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> previousSearches = ["Avengers", "Batman", "Inception"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[850], 
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  hintText: "Search movies...",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear, color: Colors.white),
                          onPressed: () {
                            _searchController.clear();
                            widget.onSearch("");
                            setState(() {});
                          },
                        )
                      : null,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
                onChanged: (value) {
                  widget.onSearch(value);
                  setState(() {});
                },
              ),
            ),
          ),

          if (previousSearches.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Previous Searches",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: previousSearches.length + 1,
              itemBuilder: (context, index) {
                if (index < previousSearches.length) {
                  return _previousSearchItem(index);
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Search Suggestions",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            _searchSuggestionItem("Avengers"),
                            _searchSuggestionItem("Captain America"),
                            _searchSuggestionItem("Aladdin"),
                            _searchSuggestionItem("Joker"),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _previousSearchItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: InkWell(
        onTap: () {
          widget.onSearch(previousSearches[index]);
        },
        child: Dismissible(
          key: Key(previousSearches[index]),
          onDismissed: (DismissDirection dir) {
            setState(() {
              previousSearches.removeAt(index);
            });
          },
          child: Row(
            children: [
              const Icon(Icons.history, color: Colors.grey),
              const SizedBox(width: 10),
              Text(
                previousSearches[index],
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              const Icon(Icons.arrow_forward, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchSuggestionItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[800], 
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
