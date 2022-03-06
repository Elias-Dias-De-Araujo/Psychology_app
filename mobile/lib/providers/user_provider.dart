import 'package:flutter/material.dart';
import '../models/user_model.dart';

class Users with ChangeNotifier {
  put(User? user) {
    print(user?.email);
    notifyListeners();
  }

  firstAcess(User? user) {}
}
