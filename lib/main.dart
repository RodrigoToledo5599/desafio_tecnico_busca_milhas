import 'package:desafio_tecnico_busca_milhas/Views/User/TelaCriarUsuario.dart';
import 'package:desafio_tecnico_busca_milhas/Views/User/TelaLogin.dart';
import 'package:desafio_tecnico_busca_milhas/SessionData/SessionData.dart';
import 'package:desafio_tecnico_busca_milhas/Views/TelaOpcoesDeVoos.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  SessionData sd = new SessionData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: TelaOpcoesDeVoos(sd: this.sd ,warning_msg: "")
      // home: TelaCriarUsuario(sd: this.sd)
      home: TelaLogin(sd: this.sd)
    );
  }
}
