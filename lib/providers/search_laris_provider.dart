import 'package:flutter/material.dart';

class SearchLarisProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  String _query = "";

  get query => _query;

  void queryListener() {
    search(searchController.text);
  }

  void resetController() {
    _query = "";
    searchController.clear();
  }

  void search(String query) {
    _query = query;
    notifyListeners();
  }
}
