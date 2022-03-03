import 'package:flutter/material.dart';
import '../models/user.dart';

class Users with ChangeNotifier {
  put(User? user) {
    print(user?.email);
    print(user?.password);
    notifyListeners();
  }

}
