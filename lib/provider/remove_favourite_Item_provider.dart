// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class RemovefavouriteItemProvider with ChangeNotifier {
  List<int> items = [];

  List<int> get SelectItems => items;

  void removeItem(int value) {
    items.remove(value);
    notifyListeners();
  }
}
