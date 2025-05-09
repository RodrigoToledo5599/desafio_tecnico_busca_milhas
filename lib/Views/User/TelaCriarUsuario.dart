import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class TelaCriarUsuario extends StatefulWidget{
  TelaCriarUsuario({Key? key}) : super(key:key);
  TelaCriarUsuarioState createState() => TelaCriarUsuarioState();
}


class TelaCriarUsuarioState extends State<TelaCriarUsuario>{


  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
            body:
            Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text("Criar Usuário"),
                  ]
              )

            )
        )
    );
  }
}