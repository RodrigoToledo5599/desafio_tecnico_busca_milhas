import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class SelectNPassageiros extends StatefulWidget{
  
  TextEditingController adultosController = TextEditingController();
  TextEditingController criancasController = TextEditingController();
  TextEditingController bebesController = TextEditingController();

  SelectNPassageiros({
    required this.adultosController,
    required this.bebesController,
    required this.criancasController,
    Key? key,
    }) : super(key: key);
  SelectNPassageirosState createState() => SelectNPassageirosState();

}

class SelectNPassageirosState extends State<SelectNPassageiros>{

  @override
  Widget build(BuildContext context){
    return Container(
        child: SingleChildScrollView(
          child: Column(
              children:[
                
              ]
          ),
        )
    );
  }
}



