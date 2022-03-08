import 'package:flutter/material.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const Text('Building (NAO ESTA LOGADO)');
    } else {
      return const Text('Building (LOGADO)');
    }
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
