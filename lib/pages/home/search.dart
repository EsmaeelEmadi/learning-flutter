import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final TextEditingController searchController;

  const Search({super.key, required this.searchController});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_updateSearchTerm);
  }

  @override
  void dispose() {
    widget.searchController.removeListener(_updateSearchTerm);
    super.dispose();
  }

  void _updateSearchTerm() {
    setState(() {
      _searchTerm = widget.searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_searchTerm);
  }
}
