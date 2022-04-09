import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'firebase_options.dart';

initializeConfiguration() async {
  //Set language ptbr
  initializeDateFormatting();

  WidgetsFlutterBinding.ensureInitialized();
  //Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => (print('Firebase Incializado')));
}
