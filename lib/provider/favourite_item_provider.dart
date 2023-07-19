// ignore_for_file: prefer_final_fields, non_constant_identifier_names

import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier {
  List<int> _selectItems = [];
  List<int> get SelectItems => _selectItems;
  void selectedItems(int value) {
    _selectItems.add(value);
    notifyListeners();
  }

  void removeitem(int value) {
    _selectItems.remove(value);
    notifyListeners();
  }
}
