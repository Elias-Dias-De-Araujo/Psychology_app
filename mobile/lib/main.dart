import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/providers/users.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/views/finish_first_acess_view.dart';
import 'package:mobile/views/first_acess_view.dart';
import 'package:mobile/views/login_view.dart';
import 'package:mobile/views/welcome_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Psychology_app',
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white
        ),
        routes: {
          AppRoutes.welcome: (_) => WelcomeView(),
          AppRoutes.login: (_) => const LoginView(),
          AppRoutes.firstAcess: (_) => const FirstAcessView(),
          AppRoutes.firstAcessFinish: (_) => const FinishFirstAcessView(),
        }
      ),
    );
  }
}
