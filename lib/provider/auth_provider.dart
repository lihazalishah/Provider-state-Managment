// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _Loading = false; // define for show loding
  bool get Loding => _Loading;
  setLoding(bool value) {
    // get value and notify a/c  to ..
    _Loading = value;
    notifyListeners();
  }

  void Login(String email, String password) async {
    setLoding(
        true); // get email, passwrod when pree login button and set loding true
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/Login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        print('Sucessful');
        setLoding(false); // after get respones setloding false
      } else {
        print('Failed');
        setLoding(false); // after get respones setloding false
      }
    } catch (e) {
      print(e.toString());
      setLoding(false); // after get respones setloding false
    }
  }
}
