// LocationSearch Page

import 'package:flutter/material.dart';
import 'package:version1/api/SearchApiService.dart';

class LocationSearch extends StatefulWidget {
  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Search'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey), // Add border
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search, color: Colors.grey),
                ),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) async {
                      final suggestions =
                      await ApiService().getAutocompleteResults(value);
                      setState(() {
                        _suggestions = suggestions;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search location',
                      border: InputBorder.none, // Remove the default border
                    ),
                  ),
                ),
              ],
            ),
          ),
          _suggestions.isNotEmpty
              ? Expanded(
            child: ListView.builder(
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_suggestions[index]),
                  onTap: () {
                    // Set the selected suggestion to the text field
                    Navigator.pop(context, _suggestions[index]);
                  },
                );
              },
            ),
          )
              : Container(),
        ],
      ),
    );
  }
}
