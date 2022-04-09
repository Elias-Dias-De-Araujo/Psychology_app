import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/database/database.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = DatabaseService.get();
  User? usuario;
  bool isLoading = true;

  AuthProvider() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String senha) async {
    try {
      await db
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((QuerySnapshot queryResult) async {
        (queryResult.size == 0)
            ? throw FirebaseAuthException(code: 'not-registered')
            : await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      });
      _getUser().then(print('chamando funcao _getUser()'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      } else if (e.code == 'not-registered') {
        throw AuthException(
            'Para utilizar nosso sistema, é necessário estar pré-registrado por um de nossos psicólogos');
      } else {
        String? a = e.message;
        throw AuthException('Erro desconhecido : $a');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser().then(print('chamando funcao _getUser()'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
