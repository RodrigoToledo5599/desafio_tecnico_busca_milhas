import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class SelectTipoDeViagem extends StatefulWidget{
  SelectTipoDeViagem({Key? key}) : super(key: key);
  SelectTipoDeViagemState createState() => SelectTipoDeViagemState();

}

class SelectTipoDeViagemState extends State<SelectTipoDeViagem>{

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Container(
          child: Column(
              children:[
                Text("Select Tipo de viagem"),
              ]
          ),
        )
    );
  }
}



