import 'package:flutter/material.dart';
import 'package:mobile/app.dart';
import 'package:mobile/config/app_config.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  await initializeConfiguration();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
      ],
      child: App(),
    ),
  );
}
