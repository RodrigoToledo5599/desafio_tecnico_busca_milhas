// import 'package:desafio_tecnico_busca_milhas/Views/TelaInicial.dart';
import 'package:desafio_tecnico_busca_milhas/Views/User/TelaCriarUsuario.dart';
import 'package:desafio_tecnico_busca_milhas/Views/User/TelaLogin.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaOpcoesDeVoos.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: TelaOpcoesDeVoos(warning_msg: "")
      // home: TelaCriarUsuario()
      home: TelaLogin()
    );
  }
}
