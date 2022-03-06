import 'package:flutter/material.dart';

class User {
  // Definição de variáveis
  String? email;
  String? genero;
  String? nome;
  String? telefone;
  Map<String, String>? endereco;

  // Construtor
  User({this.email, this.nome, this.genero, this.telefone, this.endereco});
}
