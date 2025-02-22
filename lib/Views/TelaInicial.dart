import 'package:flutter/material.dart';




class TelaInicial extends StatefulWidget{
  TelaInicial({Key? key}) : super(key: key);
  TelaInicialState createState() => TelaInicialState();
}

class TelaInicialState extends State<TelaInicial> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: ,
        // bottomNavigationBar: ,
        body: Container()
      )
    );
  }


}