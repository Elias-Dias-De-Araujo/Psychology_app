import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  logout() async {
    try {
      await context.read<AuthProvider>().logout();
    } on AuthException catch (e) {
      //setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          //As views vem aqui
          TextButton(
            onPressed: () => logout(),
            child: const Text('LOGOUT.',
                style: TextStyle(fontWeight: FontWeight.bold, color: secondaryColorHsl43)),
          ),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.smile), label: 'Humor'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.comments), label: 'Anotações'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.plusCircle), label: 'Extras'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: 'Perfil'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
        // backgroundColor: Colors.grey[100],
      ),
    );
  }
}
