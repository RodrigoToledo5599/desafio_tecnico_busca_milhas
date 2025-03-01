import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafio_tecnico_busca_milhas/Widgets/UpBar.dart';



class TelaFlightData extends StatefulWidget{
  TelaFlightData({Key? key}) : super(key: key);
  TelaFlightDataState createState() => TelaFlightDataState();
}


class TelaFlightDataState extends State<TelaFlightData>{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child:Column(
          children:[

          ]
        )
      )
    );
  }
}