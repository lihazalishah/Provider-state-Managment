import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  // changeNotifer work as setState with globle context

  int _count = 0;
  int get count => _count; // get method fir _count
  void setCount() {
    _count++;
    notifyListeners(); // function call for notify
  }
}
