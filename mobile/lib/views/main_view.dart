import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int index = 0;
  final views = [
    // Aqui coloca-se as views
    //const WelcomeView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //body: views[index],
        bottomNavigationBar: NavigationBarTheme(
      data: NavigationBarThemeData(
          backgroundColor: const Color(0xf6f6f6ff),
          indicatorColor: primary400,
          labelTextStyle: MaterialStateProperty.all(
            Theme.of(context).textTheme.bodyText2,
          )),
      child: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        height: 60,
        selectedIndex: index,
        animationDuration: const Duration(seconds: 1),
        onDestinationSelected: (index) => setState(() => this.index = index),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Ínicio'),
          NavigationDestination(
              icon: Icon(Icons.mood), selectedIcon: Icon(Icons.mood_outlined), label: 'Humor'),
          NavigationDestination(
              icon: Icon(Icons.book_outlined), selectedIcon: Icon(Icons.book), label: 'Anotações'),
          NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              selectedIcon: Icon(Icons.account_circle_rounded),
              label: 'Perfil'),
        ],
      ),
    ));
  }
}
